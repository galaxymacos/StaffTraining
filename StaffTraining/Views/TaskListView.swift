//
//  SearchView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI

struct TaskListViewModel {
    var job: Job
    
}

struct TaskListView: View {
    @State var viewModel: TaskListViewModel
    @State var showDetail = false
    @State var searchText = ""
    @State var showAddTaskView = false
    var body: some View {
        
        List(searchText.isEmpty ? viewModel.job.infos : viewModel.job.infos.filter { $0.title.contains(searchText)}, id: \.title, children: \.detail) { info in
            if info.detail != nil {
                Label(info.title, systemImage: "quote.bubble")
                    .font(.headline)
                
            }
            else {
                Text(info.title)
                    .font(.system(size: 14))
            }
        }
        
        .sheet(isPresented: $showAddTaskView, onDismiss: nil, content: {

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
            TaskListView(viewModel: .init(job: Job( id: "ff",title: .roomCleaner, infos: JobTask.exampleDatas[.roomCleaner]!)))
            
        }
        
    }
}
