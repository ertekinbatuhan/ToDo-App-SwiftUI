import SwiftUI

struct TabScreen: View {
   

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            AddToDoView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .modelContainer(for: [ToDo.self])
        
    }
}

#Preview {
    TabScreen().modelContainer(for: [ToDo.self])
}

