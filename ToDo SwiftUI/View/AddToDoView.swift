import SwiftUI
import SwiftData

struct AddToDoView: View {
    
    @State 
    private var task : String = ""
    @State
    private var selectedDateTime : Date = Date()
    @State
    private var  state : Bool = false
    
    @Environment(\.modelContext) private var context
   
    
    
    init() {
         
          let appearance = UINavigationBarAppearance()
          appearance.configureWithOpaqueBackground()
          appearance.backgroundColor = .white
          appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
          appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
          appearance.shadowColor = nil 
          
          UINavigationBar.appearance().standardAppearance = appearance
          UINavigationBar.appearance().scrollEdgeAppearance = appearance
      }
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    TextField("Enter a new Task", text: $task)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    DatePicker("Select Date and Time", selection: $selectedDateTime, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding()
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination : TabPage(), isActive: $state ) {
                    Button(action: {
                        
                        if task != "" {
                            
                            let toDo = ToDo(task: task, date: selectedDateTime)
                            context.insert(toDo)
                            
                            do {
                                try context.save()
                                state = true
                              
                            }catch{
                                print(error.localizedDescription)
                            }
                        }
                
                    }) {
                        Text("Add")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                .padding()
                }
                
                Spacer()
            }.navigationTitle("Add New Task")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView().modelContainer(for: [ToDo.self])
    }
}

