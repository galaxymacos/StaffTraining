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
    @EnvironmentObject var dataController: DataController
    var body: some View {
        
        List(searchText.isEmpty ? viewModel.job.jobTasks : viewModel.job.jobTasks.filter { $0.title.contains(searchText)}, id: \.title, children: \.detail) { jobTask in
            if jobTask.detail != nil {
                HStack {
                    Label(jobTask.title, systemImage: "quote.bubble")
                        .font(.headline)
                    
                    
                }
                
            }
            else {
                Text(jobTask.title)
                    .font(.system(size: 14))
            }
            
        }
        .onAppear(perform: {
            // MARK: Remove the first task when the TaskListView load as testing purpose to replace swipe to delete
//            print("Try delete the first document")
//            viewModel.deleteTask(for: viewModel.job.id, taskDocumentID: viewModel.job.jobTasks[0].id) { error in
//                if error == nil {
//                    print("delete the task")
////                    DispatchQueue.main.async {
//                        withAnimation {
//                            viewModel.job.jobTasks.removeFirst()
//
//                        }
////                    }
//
//
//                }
//                else {
//                    print("Error occurs when deleting an item")
//                }
//            }
        })
        
        
        .sheet(isPresented: $showAddTaskView, onDismiss: nil, content: {
            AddTaskView(taskListViewModel: $viewModel)
                .environmentObject(dataController)
        })
        .searchable(text: $searchText.animation())
        .navigationTitle(viewModel.job.title.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showAddTaskView = true
            } label: {
                Label("Add Task", systemImage: "plus")
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
