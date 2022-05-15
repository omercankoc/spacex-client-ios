import SwiftUI

struct LaunchesView: View {
    
    @ObservedObject var launchesListViewModel : LaunchesListViewModel
    
    init(){
        self.launchesListViewModel = LaunchesListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List(launchesListViewModel.launchesListViewModel,id:\.flightNumber){
                launches in
                HStack {
                    AsyncImage(url: URL(string: launches.links)){ image in
                        image.resizable().frame(width: 100, height: 100) }
                    placeholder : {
                        ProgressView()
                    }
                    .padding()
                    VStack {
                        Text(launches.webcast)
                        Text(launches.name)
                    }
                    NavigationLink(destination: LaunchesDetailView()){
                        
                    }
                }
                
            }.navigationTitle(Text("All Launches"))
        }.task {
            await launchesListViewModel.getLaunchesViewModel(url: URL(string: "https://api.spacexdata.com/v4/launches")!)
        }
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView()
    }
}
