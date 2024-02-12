import SwiftUI

struct CustomGridView: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    
    var body: some View {
        
        ZStack {
                ScrollView {
                    GeometryReader { geometry in
                        LazyVGrid(columns: columnLayout, spacing: 0) {
                            if let channel = appViewModel.channelsViewModel.channels {
                                ForEach(channel.channels, id: \.self) { entry in
                                    CustomNavLink(destination: ArticlesView()
                                        .customNavBarItems(title: nil, image: "Icon_navbar_Logo", backButtonHidden: false)
                                    ) {
                                        
                                        ZStack(alignment: .bottomLeading) {
                                            AsyncImage(url: URL(string: entry.imageUrl)) { image in
                                                image.resizable().aspectRatio(contentMode: .fill)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            
                                            HStack {
                                                Spacer()
                                                Text(entry.channel.uppercased())
                                                    .foregroundColor(.white)
                                                    .font(.custom("HelveticaNeue", size: 12))
                                                    .bold()
                                                Spacer()
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
    }
}

