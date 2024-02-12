import SwiftUI

struct CustomSegmentedControl: View {

    @State private var selectedTab: SegmentTitle?
    @Environment(\.colorScheme) private var scheme
    @State private var tabProgress: CGFloat = 0

    var body: some View {
        HStack(spacing: 0) {
            ForEach(SegmentTitle.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .font(.callout)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .contentShape(.capsule)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedTab = tab
                            switch selectedTab {
                                case .popular:
                                    tabProgress = 0.5
                                    break
                                case .explore:
                                    tabProgress = 1
                                    break
                                default:
                                    tabProgress = 0
                                    break
                            }
                        }
                    }
            }
        }
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(SegmentTitle.allCases.count)
                Capsule()
                    .stroke(scheme == .dark ? .black : .pink)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .background(.gray.opacity(0), in: .capsule)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 75, alignment: .top)
    }
}

#Preview {
    CustomSegmentedControl()
}
