//Created for BeautyCareApp in 2026
// Using Swift 6.0

import SwiftUI
struct CareTypeWideCard: View {
    
    let careType: CareType
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        NavigationLink {
            CategoryListView(careType: careType)
        } label: {
            ZStack {
                
                Image(careType.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: width,
                        height: height
                    )
                    .clipped()
                
                Color.black.opacity(0.15)
                
                Text(careType.name)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
            .frame(
                width: width,
                height: height
            )
            .clipped()
        }
        .buttonStyle(.plain)
    }
}
