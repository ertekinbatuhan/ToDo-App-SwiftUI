import SwiftUI

struct TabPage: View {
    
    var body: some View {
        
            TabView {
                    
                HomeView()
                    .tabItem {
                        Label("home", systemImage: "homekit")
                    }
                    
                        AddToDoView()
                        .tabItem {
                            Label("Add",systemImage: "plus.circle")
                            }
            }
            .modelContainer(for : [ToDo.self])
    }
}

#Preview {
    TabPage()
}
