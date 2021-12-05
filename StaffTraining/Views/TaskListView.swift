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
    var body: some View {
        List(viewModel.job.infos, id: \.title, children: \.content) { info in
            if info.content != nil {
                Label(info.title, systemImage: "quote.bubble")
                    .font(.headline)
                    
            }
            else {
                Text(info.title)
                    .font(.system(size: 14))
            }
        }
        .navigationTitle(viewModel.job.jobType.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView(viewModel: .init(job: Job(jobType: .roomCleaner, infos: Info.exampleDatas[.roomCleaner]!)))
        }
    }
}
