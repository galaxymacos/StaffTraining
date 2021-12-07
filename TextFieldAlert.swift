//
//  TextFieldAlert.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-06.
//

import SwiftUI

struct TextFieldAlert<Presenting>: View where Presenting: View {
    @Binding var isShowing: Bool
    @Binding var text: String
    let presenting: Presenting
    let title: String
    var body: some View {
        ZStack {
            self.presenting
                .disabled(isShowing)
            VStack {
                Text(self.title)
                TextField(title, text: $text, prompt: nil)
                Divider()
                HStack {
                    Button {
                        withAnimation {
                            self.isShowing.toggle()
                        }
                    } label: {
                        Text("Dismiss")
                    }
                    
                }
                
            }
            .padding()
            .background(Color.white)
            
            .frame(width: 300, height: 130)
            .shadow(radius: 1)
            .opacity(self.isShowing ? 1 : 0)
        }
    }
}

extension View {
    func textFieldAlert(isShowing: Binding<Bool>, text: Binding<String>, title: String) -> some View {
        TextFieldAlert(isShowing: isShowing, text: text, presenting: self, title: title)
    }
}

struct TextFieldAlert_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello world")
            .textFieldAlert(isShowing: .constant(true), text: .constant("input"), title: "Title")
    }
}
