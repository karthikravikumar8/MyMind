import SwiftUI

struct ChannelsView: View {
    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        
        
       CustomNavView {
            ZStack {
                Image("bg").resizable().ignoresSafeArea()
                
                VStack() {
                    CustomSegmentedControl()
                    CustomGridView()
                }


                CustomNavLink(destination: ArticlesView()
                    .customNavBarItems(title: nil, image: "Icon_navbar_Logo", backButtonHidden: false)
                ) {

                }
                .customNavBarItems(title: nil, image: "Icon_navbar_Logo", backButtonHidden: true)
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    ChannelsView()
}

