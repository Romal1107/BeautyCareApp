# BeautyCareApp

A native iOS Beauty Care application built with SwiftUI and MVVM architecture.

## Features

- Beauty care type selection
- Category listing from API
- Subcategory listing from API
- Detail screen with images and descriptions
- Async image loading and caching
- Loading, empty, and error states
- Retry support
- Dark Mode support
- Dynamic Type support

## Architecture

The project follows MVVM with a layered structure:

- **Models** — API and application data models
- **Networking** — API client, endpoints, and network errors
- **Services** — Image loading and caching
- **ViewModels** — Screen state and API interaction
- **Views** — SwiftUI user interface
- **Utilities** — Reusable helper functionality

## Technologies

- Swift
- SwiftUI
- MVVM
- URLSession
- async/await
- Codable
- NSCache

## API

The application uses the provided Beauty Care APIs for category and subcategory data.

## Requirements

- iOS 15+
- Xcode 15+
- Swift 5.9+

## Testing

The project includes unit tests for:

- API model decoding
- Category ViewModel success
- Category ViewModel failure
