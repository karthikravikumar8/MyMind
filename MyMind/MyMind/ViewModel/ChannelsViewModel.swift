import Combine
import Foundation

class ChannelsViewModel: ObservableObject {
    @Published var channels: ChannelsList?
    private var cancellables: Set<AnyCancellable> = []
    private let channelsService: ChannelsService

    
    init(channelsService: ChannelsService) {
        self.channelsService = channelsService
        loadLocalJSONFile()
        //fetchChannels()
    }

    func fetchChannels() {
        channelsService.getChannels().sink { completion in
            switch completion {
            case .failure(let error):
                print("Error fetching transactions:", error.localizedDescription)
            case .finished:
                print("Finished fetching transactions")
            }
        } receiveValue: { [weak self] result in
            self?.channels = result
        }
        .store(in: &cancellables)
    }
    
    func loadLocalJSONFile() {
        guard let url = Bundle.main.url(forResource: "Channels", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            channels = try decoder.decode(ChannelsList.self, from: data)
        } catch {
            print("Error fetching local transactions:")
        }
    }
}

