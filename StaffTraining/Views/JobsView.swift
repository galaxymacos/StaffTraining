//
//  JobTypesView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI




struct JobsView: View {
    @ObservedObject var viewModel = JobsViewModel(jobs: Job.exampleData)
    @State var searchText = ""
    var body: some View {
        List(searchText.isEmpty ? viewModel.jobs : viewModel.jobs.filter { $0.title.rawValue.contains(searchText)}) { job in
            NavigationLink(job.title.rawValue) {
                TaskListView(viewModel: .init(job: job))
            }
        }
        .searchable(text: $searchText.animation())
        .navigationTitle("Jobs")
        
    }
}

struct JobTypesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobsView()
        }
    }
}
