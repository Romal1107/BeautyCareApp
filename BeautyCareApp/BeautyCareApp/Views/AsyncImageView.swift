//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

struct AsyncImageView: View {

    let url: URL?

    @StateObject private var loader = ImageLoader()

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else if loader.isLoading {
                ZStack {
                    Color.gray.opacity(0.1)
                    ProgressView()
                }
            } else {
                ZStack {
                    Color.gray.opacity(0.1)

                    Image(systemName: "photo")
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .task(id: url) {
            await loader.load(from: url)
        }
    }
}
