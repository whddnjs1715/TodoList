//
//  DetailEditView.swift
//  Study
//
//  Created by whddnjs1715 on 31/1/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
//    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form {
            Section(header: Text("Todo Info")) {
                TextField("Title", text: $scrum.title)
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("detail Info")) {
                TextField("detail", text: $scrum.detail)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
