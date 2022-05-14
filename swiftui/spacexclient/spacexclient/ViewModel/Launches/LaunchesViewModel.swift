import Foundation
import Combine

class LaunchesListViewModel : ObservableObject {
    
    let launchesService = LaunchesService()
    @Published var launchesListViewModel = [LaunchesViewModel]()
    
    func getLaunchesViewModel(url : URL) async {
        do {
            let launches = try await launchesService.getLaunches(url: url)
            DispatchQueue.main.async {
                self.launchesListViewModel = launches.map(LaunchesViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}

struct LaunchesViewModel {
    
    let launches : LaunchesModel
    
    var launchesID : String {
        launches.launchesID ?? ""
    }
    
    var flightNumber : Int {
        launches.flightNumber ?? 0
    }
    
    var name : String {
        launches.name ?? ""
    }
    
    var details : String {
        launches.details ?? ""
    }
    
    var date : String {
        launches.date ?? ""
    }
    
    var success : Bool {
        launches.success ?? false
    }
     
    var links : String {
        launches.links?.patch?.small ?? ""
    }
}
