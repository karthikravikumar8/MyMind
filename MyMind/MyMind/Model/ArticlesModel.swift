import Foundation

struct ArticleDetails: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let source: String
    let date: String
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
}


struct Articles: Decodable {
    let channel: String
    let followers: String
    let imageUrl: String
    let articles: [ArticleDetails]
}

struct ArticlesList: Decodable {
    var channel: Articles
}
