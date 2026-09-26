//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

struct ErrorStateView: View {

    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {

            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundStyle(.orange)

            Text(message)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            Button("Retry") {
                retryAction()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
