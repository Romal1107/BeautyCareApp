//Created for BeautyCareApp in 2026
// Using Swift 6.0

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            ProgressView()
            
            Text("Loading..")
                .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
