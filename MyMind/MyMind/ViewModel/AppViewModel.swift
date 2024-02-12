import Foundation
import Combine

class AppViewModel: ObservableObject {
    let channelsViewModel = ChannelsViewModel(channelsService: ChannelsService())
    let articlesViewModel = ArticlesViewModel(articlesService: ArticlesService())
    let articleViewModel = ArticleViewModel(articleService: ArticleService())
}
