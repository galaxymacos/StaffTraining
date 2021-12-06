//
//  AddTaskView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-05.
//

import SwiftUI

struct AddTaskView: View {
    @State var title: String = ""
    @State var detail: String = ""
    @State var details: [String] = .init(repeating: "", count: 1)
    @State var detailLevel: Int = 0
    @State var jobDocumentID: String
    @EnvironmentObject var dataController: DataController
    @Environment(\.dismiss) var dismiss
    
    func save() {
        let detailJobTask = details.map { JobTask(title: $0, detail: nil) }
        let newJobTask = JobTask(title: title, detail: detailJobTask)
        
    }
    
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
            
            HStack {
                Button("Add Detail") {
                    withAnimation {
                        detailLevel += 1
                        print("Detail level: \(detailLevel)")
                    }
                }
                .padding(.leading, 50)
                Spacer()
                Button("Remove Detail") {
                    if detailLevel > 0 {
                        withAnimation {
                            detailLevel -= 1
                        }
                    }
                }
                .padding(.trailing, 50)
            }
            
            ForEach(0..<detailLevel, id: \.self) { currentDetailLevel in
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
            Spacer()
            
            Button {
                dataController.addTask(for: jobDocumentID, title: title, details: details)
                dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)

            
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(jobDocumentID: "xx")
    }
}
