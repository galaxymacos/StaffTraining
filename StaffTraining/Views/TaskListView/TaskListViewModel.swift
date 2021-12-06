//
//  TaskListViewModel.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-06.
//

import Foundation
import Firebase

struct TaskListViewModel {
    
    enum TaskListError: Error {
        case updateError
    }
    
    var job: Job
    
    
    mutating func addTask(for jobDocumentID: String, title: String, details: [String], completion: @escaping (String, Error?) -> Void) {
        let db = Firestore.firestore()
        let newTaskDocumentReference = db.collection("Job/\(jobDocumentID)/Task").addDocument(data: ["title": title, "detail": details]) { error in
            if error == nil {
                
//                DispatchQueue.main.async {
//                    var jobUpdating = self.jobs.first(where: { $0.id == jobDocumentID})!
//                    let jobTaskDetails = details.map { JobTask(title: $0, detail: nil) }
//                    withAnimation {
//                        jobUpdating.infos.append(.init(title: title, detail: [.init(title: title, detail: jobTaskDetails)]))
//                    }
//                    print("Updating the data")
//                }
                // TODO:
                print("finish adding task")
//                self.getData()
            }
            
        }
        completion(newTaskDocumentReference.documentID, nil)
        
    }
    
    mutating func deleteTask(for jobDocumentID: String, taskDocumentID: String, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()
        print("Trying to delete the task \(taskDocumentID) in \(jobDocumentID)")
        db.collection("Job/\(jobDocumentID)/Task").document(taskDocumentID).delete { error in
            completion(error)
        }
    }
}
