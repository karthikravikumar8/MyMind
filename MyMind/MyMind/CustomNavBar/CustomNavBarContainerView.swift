import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String? = nil//"Title"
    @State private var navImage: String? = nil //"Icon_navbar_Logo"
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            CustomNavBarView(showBackButton: showBackButton, title: title, navImage: navImage)
            content.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarImagePreferenceKey.self, perform: { value in
            self.navImage = value
        })
        .onPreferenceChange(CustomNavBarButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    CustomNavBarContainerView {
        Text("Hello Karthik")
            .foregroundColor(.white)
            .customNavigationTitle("New Title")
            .customNavigationImage("Icon_navbar_Logo")
            .customNavigationBarBackButtonHidden(true)
    }
}
