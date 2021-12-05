//
//  JobsViewModel.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-05.
//

import Foundation
import Firebase

class JobsViewModel: ObservableObject {
    @Published var jobs: [Job]
    
    init() {
        jobs = []
        getData()
    }
    
    convenience init(jobs: [Job]) {
        self.init()
        self.jobs = jobs
    }
    
    func getData() {
        guard jobs.isEmpty else {
            fatalError("The jobs array is not empty")
        }
        let db = Firestore.firestore()
        db.collection("Job").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ d in
                if
                    let jobTitleInString = d["title"] as? String,
                    let jobTitle = JobTitle(rawValue: jobTitleInString)
                {
                    var job = Job(id: d.documentID, title: jobTitle, infos: [])
                    db.collection("Job/\(d.documentID)/Task").getDocuments { taskSnapshot, error in
                        taskSnapshot?.documents.forEach({ taskD in
                            if let taskTitle = taskD["title"] as? String,
                               let taskDetail = taskD["detail"] as? [String] {
                                DispatchQueue.main.async {
                                    let tasks = taskDetail.map { str in
                                        JobTask(title: str, detail: nil)
                                    }
                                    job.infos = [.init(title: taskTitle, detail: tasks)]
                                    self.jobs.append(job)
                                }
                            }
                            else {
                                print("Can't get tasks array inside a job")
                            }
                        })
                    }
                    
                    
                    
                }
                else {
                    print("Can't retrive task")
                }
            })
                
        }
    }
}
