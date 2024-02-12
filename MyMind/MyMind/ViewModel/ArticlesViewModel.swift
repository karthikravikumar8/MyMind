import Combine
import Foundation

class ArticlesViewModel: ObservableObject {
    @Published var articlesList: ArticlesList?
    private var cancellables: Set<AnyCancellable> = []
    private let articlesService: ArticlesService

    init(articlesService: ArticlesService) {
        self.articlesService = articlesService
        loadLocalJSONFile()
        //fetchArticles()
    }

    func fetchArticles() {
        
        articlesService.getArticles().sink { completion in
            switch completion {
            case .failure(let error):
                print("Error fetching transactions:", error.localizedDescription)
            case .finished:
                print("Finished fetching transactions")
            }
        } receiveValue: { [weak self] result in
            self?.articlesList = result
        }
        .store(in: &cancellables)
    }
    
    func loadLocalJSONFile() {
        guard let url = Bundle.main.url(forResource: "Articles", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            articlesList = try decoder.decode(ArticlesList.self, from: data)
        } catch {
            print("Error fetching local transactions:")
        }
    }
    
    
    
}

