//Created for BeautyCareApp in 2026
// Using Swift 6.0

import SwiftUI

struct CategoryListView: View {
    
    let careType : CareType
    
    @StateObject private var viewModel = CategoryViewModel()
    
    var body: some View {
        Group {
            switch viewModel
                .state {
                
            case .idle:
                LoadingView()
                
            case .loading:
                LoadingView()
                
            case .loaded(let categories):
                categoryList(categories)
                
            case .empty:
                EmptyStateView(message: "No categories found")
                
            case .failed(let message):
                ErrorStateView(message: message){
                    Task {
                        await viewModel.loadCategories(applicationId: careType.applicationId)
                    }
                }
            }
        }
        .navigationTitle(careType.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadCategories(applicationId: careType.applicationId)
        }
    }
}

extension CategoryListView {
    
    private func categoryList(_ categories: [Category]) -> some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(categories) { category in
                    
                    NavigationLink {
                        SubcategoryListView(careType: careType, category: category)
                    } label: {
                        
                        CategoryRow(category: category)
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
    }
}

struct CategoryRow: View {
    let category: Category
    
    var body: some View {
        HStack(spacing:16)  {
            AsyncImageView(
                url: URL(string: category.image)
            )
            .frame(width: 110, height: 110)
            .clipped()
            .clipShape(
                RoundedRectangle(cornerRadius: 14)
            )
        
            VStack(alignment: .leading, spacing: 3){
                Text(category.categoryName)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Text("Tap to explore")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.secondary)
                .padding()
        }
//        .padding(14)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 200)
        .background(
            RoundedRectangle(
                cornerRadius: 18
            )
            .fill(
                Color(.secondarySystemBackground)
            )
        )
        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}
#Preview {
    NavigationStack {
        CategoryListView(
            careType: CareType(
                id: "face",
                name: "Face Care",
                applicationId: "19",
                imageName: "face"
            )
        )
    }
}
