import SwiftUI

struct SettingsView: View {
    
    @State
    private var changeTheme: Bool = false
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var scheme
    @State 
    private var isLoggedOut = false

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Appearance")) {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
                
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme) {
            ThemeScreen(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        }
    }
}


#Preview {
    SettingsView()
}


