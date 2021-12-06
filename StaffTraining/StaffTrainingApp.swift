//
//  StaffTrainingApp.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI
import Firebase

@main
struct StaffTrainingApp: App {
    init() {
        FirebaseApp.configure()
        print("Fire base app configured")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
