import Foundation

class LaunchesService {
    func getLaunches(url : URL) async throws -> [LaunchesModel] {
        let (data,_) = try await URLSession.shared.data(from: url)
        let launches = try? JSONDecoder().decode([LaunchesModel].self, from: data)
        return launches ?? []
    }
    
    func getLaunch(url : URL) async throws -> LaunchesModel {
        let (data,_) = try await URLSession.shared.data(from: url)
        let launch = try JSONDecoder().decode(LaunchesModel.self, from: data)
        return launch
    }
}
