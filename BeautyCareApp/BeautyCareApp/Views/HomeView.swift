import SwiftUI

struct HomeView: View {

    let careTypes = CareType.all

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in

                ScrollView {
                    VStack(spacing: 0) {

                        // MARK: - Header

                        Text("Beauty Care")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 24)
                            .background(
                                Color(.systemBackground)
                            )

                        // MARK: - Face + Hair

                        HStack(spacing: 0) {

                            careCard(
                                careType: careTypes[0],
                                width: geometry.size.width,
                                height: 230,
                                isHalfWidth: true
                            )

                            careCard(
                                careType: careTypes[1],
                                width: geometry.size.width,
                                height: 230,
                                isHalfWidth: true
                            )
                        }

                        // MARK: - Eye

                        careCard(
                            careType: careTypes[2],
                            width: geometry.size.width,
                            height: 300,
                            isHalfWidth: false
                        )

                        // MARK: - Lips + Teeth

                        HStack(spacing: 0) {

                            careCard(
                                careType: careTypes[3],
                                width: geometry.size.width,
                                height: 230,
                                isHalfWidth: true
                            )

                            careCard(
                                careType: careTypes[4],
                                width: geometry.size.width,
                                height: 230,
                                isHalfWidth: true
                            )
                        }

                        // MARK: - Nail

                        careCard(
                            careType: careTypes[5],
                            width: geometry.size.width,
                            height: 300,
                            isHalfWidth: false
                        )

                        // MARK: - Hand + Leg

                        HStack(spacing: 0) {

                            careCard(
                                careType: careTypes[6],
                                width: geometry.size.width,
                                height: 230,
                                isHalfWidth: true
                            )

                            careCard(
                                careType: careTypes[7],
                                width: geometry.size.width,
                                height: 230,
                                isHalfWidth: true
                            )
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .frame(width: geometry.size.width)
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }

    // MARK: - Care Card

    @ViewBuilder
    private func careCard(
        careType: CareType,
        width: CGFloat,
        height: CGFloat,
        isHalfWidth: Bool
    ) -> some View {

        let cardWidth = isHalfWidth
            ? width / 2
            : width

        NavigationLink {
            CategoryListView(
                careType: careType
            )
        } label: {

            ZStack {

                Image(careType.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: cardWidth,
                        height: height
                    )
                    .clipped()

                Color.black.opacity(0.18)

                Text(careType.name)
                    .font(
                        .system(
                            size: 26,
                            weight: .bold
                        )
                    )
                    .foregroundStyle(.white)
                    .shadow(
                        color: .black.opacity(0.5),
                        radius: 4
                    )
            }
            .frame(
                width: cardWidth,
                height: height
            )
            .clipped()
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
}
