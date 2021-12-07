//
//  SearchView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI


struct TaskListView: View {
    @State var viewModel: TaskListViewModel
    @State var showDetail = false
    @State var searchText = ""
    @State var showAddTaskView = false
    @State var showDeleteAlert = false
    @State var numberToDelete = ""
    @EnvironmentObject var dataController: DataController
    
   func deleleTask(taskID: String) {
//        guard index >= 0, index < viewModel.job.jobTasks.count else {
//            print("index out of bound - Stop deleing task")
//            return
//
//        }
        viewModel.deleteTask(for: viewModel.job.id, taskDocumentID: taskID) { error in
            if error == nil {
                withAnimation {
                     viewModel.job.jobTasks.removeAll(where: { $0.id == taskID })
                    }
                print("Delete the task with the id: \(taskID)")
                    
            }
            else {
                print("Error occurs when deleting task with the id: \(taskID)")
            }
        }
    }
    
    var body: some View {
        
        List(searchText.isEmpty ? viewModel.job.jobTasks : viewModel.job.jobTasks.filter { $0.title.contains(searchText)}, id: \.title, children: \.detail) { jobTask in
            if jobTask.detail != nil {
                HStack {
                    Label(jobTask.title, systemImage: "quote.bubble")
                        .font(.headline)
                    Spacer()
                }
                .onTapGesture(count: 2) {
                    print("Double click the job task with the id: \(jobTask.id)")
                    deleleTask(taskID: jobTask.id)
                }
            }
            else {
                Text(jobTask.title)
                    .font(.system(size: 14))
            
            }
            
        }
        
        
        .sheet(isPresented: $showAddTaskView, onDismiss: nil, content: {
            AddTaskView(taskListViewModel: $viewModel)
                .environmentObject(dataController)
        })
        .searchable(text: $searchText.animation())
        .navigationTitle(viewModel.job.title.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .textFieldAlert(isShowing: $showDeleteAlert, text: $numberToDelete, title: "Delete the number")
        .toolbar {
            HStack {
                Button {
                    showAddTaskView = true
                } label: {
                    Label("Add Task", systemImage: "plus")
                }
                
                Button {
                    showDeleteAlert = true
                } label: {
                    Label("Delete Task", systemImage: "trash")
                }
            }
            
            
        }
        
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView(viewModel: .init(job: Job( id: "ff",title: .roomCleaner, jobTasks: JobTask.exampleDatas[.roomCleaner]!)))
            
        }
        
    }
}
