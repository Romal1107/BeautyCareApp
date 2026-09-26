//Created for BeautyCareApp in 2026
// Using Swift 6.0


import Foundation

enum HTMLTextParser {

    static func plainText(from html: String) -> String {
        guard let data = html.data(using: .utf8) else {
            return html
        }

        do {
            let attributedString = try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )

            return attributedString.string
                .replacingOccurrences(of: "\n\n\n", with: "\n\n")
                .trimmingCharacters(in: .whitespacesAndNewlines)

        } catch {
            return html
        }
    }
}
