//
//  AddJobView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-08.
//

import SwiftUI

struct AddJobView: View {
    @Environment(\.dismiss) var dismiss
    @State var jobTitle = ""
    @State var jobDescription = ""  // MARK: Current unused
    @EnvironmentObject var dataContoller: DataController
    var body: some View {
        VStack {
            Form {
                TextField("Title", text: $jobTitle, prompt: Text("Title"))
                TextField("Job Description", text: $jobDescription, prompt: Text("Description"))
            }
            
            
        }
        .navigationTitle("New Job")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.red)
                
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Confirm") {
                    // TODO: Save a new job
                    dataContoller.addJob(title: jobTitle) { documentID, error in
                        guard error == nil else {
                            return
                        }
                        
                    }
                    dismiss()
                }
                .font(.headline)
                
            }
//            Button("Done"){
//                dismiss()
//            }
        }
    }
}

struct AddJobView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddJobView()
        }
    }
}
