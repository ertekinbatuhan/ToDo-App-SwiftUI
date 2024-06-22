import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \ToDo.date, order: .reverse) private var toDos: [ToDo]
    @State private var selectedToDo: ToDo?
    @State private var isAddingToDo = false
    @State private var searchText: String = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        appearance.shadowColor = nil
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func deleteToDo(indexSet: IndexSet) {
        indexSet.forEach { index in
            let toDo = toDos[index]
            context.delete(toDo)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
   
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(toDos.filter {
                        searchText.isEmpty || $0.task.localizedCaseInsensitiveContains(searchText)
                    }) { toDo in
                        NavigationLink(
                            destination: UpdateTodoView(toDo: toDo),
                            tag: toDo,
                            selection: $selectedToDo
                        ) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(toDo.task)
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                    Text(toDo.date, formatter: dateFormatter)
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                selectedToDo = toDo
                            }
                        }
                    }
                    .onDelete(perform : deleteToDo)
                }
                .navigationTitle("My Tasks")
            }
            .searchable(text: $searchText)
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}

#Preview {
    
   HomeView().modelContainer(for: [ToDo.self])

}
