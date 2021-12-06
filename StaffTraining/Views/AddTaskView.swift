//
//  AddTaskView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-05.
//

import SwiftUI

struct AddTaskView: View {
    @State var title: String = ""
    @State var details: [String] = []
    @Binding var taskListViewModel: TaskListViewModel
    
    @EnvironmentObject var dataController: DataController
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            Text("Add a task")
                .font(.system(size: 32))
            HStack {
                Text("Task title")
                    .frame(width: 100, alignment: .center)
                    .padding(.leading)
                Spacer()
                TextField("Title", text: $title, prompt: nil)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .padding(.trailing)
                
            }
            
            if let details = details {
                
                ForEach(0..<details.count, id: \.self) { currentDetailLevel in
                    HStack {
                        Text("Task Detail")
                            .frame(width: 100, alignment: .center)
                            .padding(.leading)
                        Spacer()
                        TextField("Task Detail", text: $details[currentDetailLevel], prompt: nil)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 200)
                            .padding(.trailing)
                    }
                    .transition(.slide)
                }
            }
            HStack {
                Button("Add Detail") {
                    withAnimation {
                            details.append("")
                        
                    }
                }
                .padding(.leading, 50)
                Spacer()
                Button("Remove Detail") {
                    if details.count >= 1 {
                        withAnimation {
                            details.removeLast()
                        }
                    }
                }
                .padding(.trailing, 50)
            }
            Spacer()
            
            Button {
                dataController.addTask(for: taskListViewModel.job.id, title: title, details: details)
                let jobTaskDetails = details.map { JobTask(title: $0, detail: nil) }
                taskListViewModel.job.infos.append(.init(title: title, detail: jobTaskDetails))
                dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)

            
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskListViewModel: .constant(TaskListViewModel(job: Job.exampleData[0])))
    }
}
