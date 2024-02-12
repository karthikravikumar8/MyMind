import Foundation

struct Article: Decodable {
    let imageUrl: String
    let content: String
    let title: String
    let source: String
    let date: String
    let channel: String
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var paragraphs: [String] {
        return content.components(separatedBy: "\n")
    }
    

}

struct ArticleResponse: Decodable {
    var article: Article
}
