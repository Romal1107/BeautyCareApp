//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

struct EmptyStateView: View {
    let message: String
    
    var body: some View {
        VStack(spacing: 12) {
            
            Image(systemName: "tray")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            
            Text(message)
                .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
