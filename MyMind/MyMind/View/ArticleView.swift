import SwiftUI

struct ArticleView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        
        ScrollView {
            if let article = appViewModel.articleViewModel.article?.article {

                ZStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: article.imageUrl)) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(article.title)
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue", size: 20))
                        .bold()
                }
                
                
                HStack(spacing: 20) {
                    Image("icon_list_source")
                    Text(article.source)
                        .font(.custom("HelveticaNeue", size: 12))
                    Image("icon_list_time")
                    
                    Text(article.dateParsed.formatted())
                        .font(.custom("HelveticaNeue", size: 12))
                    Spacer()
                    Text(article.channel.uppercased())
                        .font(.custom("HelveticaNeue", size: 12))
                        .overlay(
                            Rectangle().frame(height: 1).offset(y: 4)
                            , alignment: .bottom)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(article.paragraphs[0])
                        .font(.custom("HelveticaNeue", size: 14))
                        .lineSpacing(10.0)
                    Text(article.paragraphs[1])
                        .font(.custom("HelveticaNeue", size: 14))
                        .bold()
                        .lineSpacing(10.0)
                    Text(article.paragraphs[2])
                        .font(.custom("HelveticaNeue", size: 14))
                        .lineSpacing(10.0)
                }
                .padding()
            }
        }
    }
}
