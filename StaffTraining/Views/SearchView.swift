//
//  SearchView.swift
//  StaffTraining
//
//  Created by xunruan on 2021-12-04.
//

import SwiftUI

struct SearchViewModel {
    var jobRequirement: Job
}

struct SearchView: View {
    @State var viewModel: SearchViewModel
    var body: some View {
        List(viewModel.jobRequirement.infos) { info in
            Text(info.title)
        }
        .navigationTitle(viewModel.jobRequirement.jobType.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView(viewModel: .init(jobRequirement: Job(jobType: .roomCleaner, infos: Info.exampleDatas[.roomCleaner]!)))
        }
    }
}
