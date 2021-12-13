//
//  JobRequirement.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

/// The struct contains a job and a list of infos he/she has to master
struct Job: Identifiable, Decodable {
    var id: String
    /// The type of job
    var title: String
    /// The list of information that the people having this job should know
    var jobTasks: [JobTask]
}

extension Job {
    static var exampleData: [Job] = [
        .init(id: "fefe" ,title: "Front Desk Manager", jobTasks: JobTask.sampleTaskForCleaner),
        .init(id: "fefef", title: "Room Cleaner", jobTasks: JobTask.sampleTaskForCleaner),
    ]
}


