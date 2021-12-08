//
//  ContentView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataController = DataController()
    
    
    var body: some View {
        NavigationView {
            JobsView(jobsViewModel: .init())
                .environmentObject(dataController)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
