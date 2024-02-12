import SwiftUI

struct ArticlesViewRow: View {
    var articles: ArticleDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(articles.title)
                .font(.custom("HelveticaNeue", size: 14))
                .bold()
            
            HStack(spacing: 10) {
                Image("icon_list_source")
                Text(articles.source)
                    .font(.custom("HelveticaNeue", size: 12))
                    .lineLimit(1)
                                
                Image("icon_list_time")
                Text(articles.dateParsed.formatted())
                    .font(.custom("HelveticaNeue", size: 12))
                
                Spacer()

            }
        }
        .padding()
    }
}

#Preview {
    ArticlesViewRow(articles: articlesPreviewData)
}
