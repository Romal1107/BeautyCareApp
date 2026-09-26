//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

struct SubcategoryListView: View {
    let careType: CareType
    let category: Category
    
    @StateObject private var viewModel = SubcategoryViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .idle:
                LoadingView()
                
            case .loading:
                LoadingView()
            
            case .loaded(let subcategories):
                subcategoryList(subcategories)
                
            case .empty:
                EmptyStateView(message: "No subcategories found")
                
            case .failed(let message):
                ErrorStateView(message: message) {
                    Task {
                        await viewModel.retry(
                            applicationId: careType.applicationId,
                            categoryId: category.id
                        )
                    }
                }
            }
        }
        .navigationTitle(category.categoryName)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadSubcategories(applicationId: careType.applicationId, categoryId: category.id)
        }
    }
}

private extension SubcategoryListView {

    func subcategoryList(
        _ subcategories: [Subcategory]
    ) -> some View {

        ScrollView {
            LazyVStack(spacing: 16) {

                ForEach(subcategories) { subcategory in

                    NavigationLink {
                        DetailView(
                            subcategory: subcategory
                        )
                    } label: {
                        SubcategoryRow(
                            subcategory: subcategory
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
    }
}

struct SubcategoryRow: View {
    let subcategory: Subcategory

    var body: some View {
        HStack(spacing: 18) {
            AsyncImageView(
                url: URL(string: subcategory.image)
            )
            .frame(width: 110, height: 110)
            .clipShape(
                RoundedRectangle(cornerRadius: 14)
            )

            VStack(alignment: .leading, spacing: 8) {

                Text(displayName)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Text(subcategory.subcategoryName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .padding()
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
        )
        .shadow(
            color: .black.opacity(0.12),
            radius: 8,
            x: 0,
            y: 4
        )
    }
    

    private var displayName: String {
        if let english = subcategory.language.first(
            where: {
                $0.languageName.lowercased() == "english" &&
                !$0.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
        ) {
            return english.name
        }

        if let firstValid = subcategory.language.first(
            where: {
                !$0.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
        ) {
            return firstValid.name
        }

        return subcategory.subcategoryName
    }
}
#Preview {
    NavigationStack {
        SubcategoryListView(
            careType: CareType(
                id: "face",
                name: "Face Care",
                applicationId: "19",
                imageName: "face"
            ),
            category: Category(
                id: "1",
                applicationId: "19",
                categoryName: "Remedy",
                image: "",
                audioFile: "",
                language: [
                    CategoryLanguage(
                        languageName: "English",
                        name: "Remedy",
                        description: ""
                    )
                ]
            )
        )
    }
}
