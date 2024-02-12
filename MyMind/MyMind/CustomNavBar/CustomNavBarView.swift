import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String?
    let navImage: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            
            Spacer()
                        
            if (title != nil) {
                titleSection
            } else {
                titleImage
            }
            
            Spacer()
            
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color(red: 161/255, green: 117/255, blue: 211/255))
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            if (title != nil) {
                Image("icon_navbar_close")
            } else {
                Image(systemName: "chevron.left")
            }
        })
    }
    
    private var titleSection: some View {
        Text(title ?? "")
            .font(.title)
            .fontWeight(.semibold)
    }
    
    private var titleImage: some View {
        Image(navImage ?? "")
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, title: "Title here", navImage: "Image goes here")
        Spacer()
    }
}
