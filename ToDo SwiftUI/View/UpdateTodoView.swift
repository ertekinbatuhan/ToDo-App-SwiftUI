//
//  UpdateTodoView.swift
//  ToDo SwiftUI
//
//  Created by Batuhan Berk Ertekin on 22.06.2024.
//

import SwiftUI

struct UpdateTodoView: View {
    
    @State private var task: String = ""
    @State private var date: Date = Date()
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let toDo : ToDo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            TextField("Enter Task", text: $task)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(color: Color(.systemGray4), radius: 3, x: 0, y: 2)
                .font(.title3)
                .frame(maxWidth: .infinity)
            
            DatePicker("Date",selection: $date, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(color: Color(.systemGray4), radius: 3, x: 0, y: 2)
                .font(.title3)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Button(action: {
                
                toDo.date = date
                toDo.task = task
                
                do {
                    try context.save()
                }catch{
                    print(error.localizedDescription)
                }
                dismiss()
                
            }) {
                Text("Update")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }.onAppear(perform: {
                date = toDo.date
                task = toDo.task
                
            })
            .padding(.bottom, 30)
        }
        .padding()
        .navigationBarTitle("Update Task").navigationBarTitleDisplayMode(.large)
    }
    
}
