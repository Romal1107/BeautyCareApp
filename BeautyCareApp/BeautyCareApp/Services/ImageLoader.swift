//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import UIKit

@MainActor
final class ImageLoader: ObservableObject {

    @Published private(set) var image: UIImage?
    @Published private(set) var isLoading = false

    private static let cache = NSCache<NSString, UIImage>()

    func load(from url: URL?) async {
        guard let url else {
            return
        }

        let key = url.absoluteString as NSString

        if let cachedImage = Self.cache.object(forKey: key) {
            image = cachedImage
            return
        }

        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let downloadedImage = UIImage(data: data) else {
                return
            }

            Self.cache.setObject(downloadedImage, forKey: key)
            image = downloadedImage

        } catch {
            image = nil
        }
    }
}
