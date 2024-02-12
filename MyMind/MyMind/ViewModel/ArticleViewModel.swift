import Combine
import Foundation

class ArticleViewModel: ObservableObject {
    @Published var article: ArticleResponse?
    private var cancellables: Set<AnyCancellable> = []
    private let articleService: ArticleService

    
    init(articleService: ArticleService) {
        self.articleService = articleService
        loadLocalJSONFile()
        //fetchArticle()
    }

    func fetchArticle() {
        
        articleService.getArticle().sink { completion in
            switch completion {
            case .failure(let error):
                print("Error fetching transactions:", error.localizedDescription)
            case .finished:
                print("Finished fetching transactions")
            }
        } receiveValue: { [weak self] result in
            self?.article = result
        }
        .store(in: &cancellables)
    }
    
    func loadLocalJSONFile() {
        guard let url = Bundle.main.url(forResource: "Article", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            article = try decoder.decode(ArticleResponse.self, from: data)
        } catch {
            print("Error fetching local transactions:")
        }
    }
}

