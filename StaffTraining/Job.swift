//
//  JobRequirement.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import Foundation

/// The struct contains a job and a list of infos he/she has to master
struct Job: Codable, Identifiable, Hashable {
    var id = UUID()
    /// The type of job
    var jobType: JobType
    /// The list of information that the people having this job should know
    var infos: [Info]
}

extension Job {
    static var exampleData: [Job] = [
        .init(jobType: .frontDeskManager, infos: Info.sampleTaskForCleaner),
        .init(jobType: .roomCleaner, infos: Info.sampleTaskForCleaner),
    ]
}
