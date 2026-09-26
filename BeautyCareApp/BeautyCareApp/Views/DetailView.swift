//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

struct DetailView: View {
    
    let subcategory : Subcategory
    
    private var displayName: String {
        if let english = subcategory.language.first(where: {
            $0.languageName.lowercased() == "english" && !$0.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        ){
            return english.name
        }
        
        if let firstValid = subcategory.language.first(
            where: {
                !$0.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
            
        ){
            return firstValid.name
        }
        return subcategory.subcategoryName
    }
    
    private var displayDescription: String {
        if let english = subcategory.language.first(
            where: {
                $0.languageName.lowercased() == "english" &&
                !$0.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
        ) {
            return HTMLTextParser.plainText(
                from: english.description
            )
        }
        
        if let firstValid = subcategory.language.first(
            where: {
                !$0.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
        ) {
            return HTMLTextParser.plainText(
                from: firstValid.description
            )
        }
        
        return "No description available."
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                AsyncImageView(
                    url: URL(string: subcategory.image)
                )
                .frame(
                    maxWidth: .infinity,
                    minHeight: 240,
                    maxHeight: 300
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
                
                // Title
                Text(displayName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                // Category type
                Text(subcategory.subcategoryName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                // Description
                Text(displayDescription)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .lineSpacing(5)
                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )
            }
            .padding()
        }
        .navigationTitle(displayName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
