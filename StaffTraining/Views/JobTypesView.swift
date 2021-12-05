//
//  JobTypesView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI

struct JobsView {
    var jobs: [Job]
}

struct JobTypesView: View {
    @State var viewModel = JobsView(jobs: Job.exampleData)
    var body: some View {
        List(viewModel.jobs) { job in
            NavigationLink(job.jobType.rawValue) {
                TaskListView(viewModel: .init(job: job))
            }
        }
        .navigationTitle("Jobs")
        
    }
}

struct JobTypesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobTypesView()
        }
    }
}
