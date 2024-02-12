import SwiftUI

struct ArticlesView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        
        if let channel = appViewModel.articlesViewModel.articlesList?.channel {
            
            List {
                Section{
                    
                    ZStack(alignment: .top) {
                        
                        AsyncImage(url: URL(string: channel.imageUrl)) { image in
                            image.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack {
                            
                            Spacer()
                            
                            Text("\(channel.channel.uppercased()) CHANNEL")
                                .foregroundColor(.white)
                                .font(.custom("HelveticaNeue", size: 20))
                                .bold()
                            
                            Spacer()
                            
                            Capsule()
                                .fill(Color.pink)
                                .frame(width: 80, height: 30)
                                .overlay(
                                    Text("Following")
                                        .foregroundColor(.white)
                                        .font(.custom("HelveticaNeue", size: 12))
                                        .bold()
                                )
                                .padding()
                            
                            
                            Spacer()
                            
                            Text(channel.followers)
                                .foregroundColor(.white)
                                .font(.custom("HelveticaNeue", size: 12))
                            
                            Spacer()
                            
                        }
                    }
                    
                }
                ForEach(Array(channel.articles.enumerated()), id: \.element) {
                    index, article in
                    
                    CustomNavLink(destination: ArticleView()
                        .customNavBarItems(title: "\(channel.channel.uppercased()) CHANNEL", image: nil, backButtonHidden: false)
                    ) {
                        
                        ArticlesViewRow(articles: article)
                        
                    }
                    
                }
                
            }
            .listStyle(.plain)
            
        }
        
    }
}
