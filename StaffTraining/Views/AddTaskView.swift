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
    @State var details: [String] = ["",""]
    @State var detailLevel: Int = 0
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
                    detailLevel += 1
                }
                .padding(.leading, 50)
                Spacer()
                Button("Remove Detail") {
                    detailLevel -= 1
                }
                .padding(.trailing)
            }
            
            HStack {
                Text("Task Detail")
                    .frame(width: 100, alignment: .center)
                    .padding(.leading)
                Spacer()
                TextField("Task Detail", text: $details[0], prompt: nil)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .padding(.trailing)
            }
            
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
