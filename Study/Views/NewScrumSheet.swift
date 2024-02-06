//
//  NewScrumSheet.swift
//  Study
//
//  Created by whddnjs1715 on 31/1/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @State private var showAlert = false
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    func containTitle(name: String) -> Bool{
        return scrums.contains{ scrums in
            return scrums.title == name
        }
    }
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            if containTitle(name: newScrum.title) {
                                showAlert = true
                            }else if newScrum.title.isEmpty{
                                showAlert = true
                            }else {
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                            }
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Current Action Not Available"),
                                message: Text("Please Write Title")
                            )
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData),
                      isPresentingNewScrumView: .constant(true))
    }
}
