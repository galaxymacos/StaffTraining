//
//  JobTypesView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI




struct JobsView: View {
    @EnvironmentObject var dataController: DataController
    @State var jobsViewModel: JobsViewModel
    
    
    @State var searchText = ""
    
    func delete(at offset: IndexSet) {
        dataController.jobs.remove(atOffsets: offset)
        
    }
    
    var body: some View {
        List {
            ForEach(searchText.isEmpty ? dataController.jobs : dataController.jobs.filter { $0.title.rawValue.contains(searchText)}){ job in
                NavigationLink(job.title.rawValue) {
                    TaskListView(viewModel: .init(job: job))
                        .environmentObject(dataController)
                }
            }
            .onDelete { indexSet in
                print("Delete the job at \(String(describing: indexSet.first)) accordingly")
                for index in indexSet {
                    dataController.deleteJob(for: dataController.jobs[index].id) { error in
                        if error == nil {
                            print("Delete job successful at index \(index)")
                        }
                        else {
                            print("Unable to delete job at index \(index)")
                        }
                    }
                    delete(at: indexSet)
                    
                }
                
            }
        }
        .toolbar(content: {
            HStack {
                Button {
                    
                } label: {
                    Label("Add Job", systemImage: "plus")
                }
                EditButton()
                
            }
            
        })
        .searchable(text: $searchText.animation())
        .navigationTitle("Jobs")
        
    }
}

struct JobTypesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobsView(jobsViewModel: .init())
                .environmentObject(DataController())
        }
    }
}
