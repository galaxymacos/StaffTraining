//
//  JobTypesView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI


struct JobsView: View {
    @EnvironmentObject var dataController: DataController
    
    @State var searchText = ""
    var body: some View {
        List(searchText.isEmpty ? dataController.jobs : dataController.jobs.filter { $0.title.rawValue.contains(searchText)}) { job in
            NavigationLink(job.title.rawValue) {
                TaskListView(viewModel: .init(job: job))
                    .environmentObject(dataController)
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
                .environmentObject(DataController())
        }
    }
}
