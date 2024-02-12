struct Channel: Decodable, Hashable, Identifiable {
    let id: Int
    var channel: String
    var imageUrl: String
}

struct ChannelsList: Decodable {
    var channels: [Channel]
}
