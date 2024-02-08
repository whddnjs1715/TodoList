//
//  DetailView.swift
//  Study
//
//  Created by whddnjs1715 on 30/1/24.
//

import SwiftUI
    
struct DetailView: View {
    @Binding var scrum: DailyScrum
    @Binding var scrums: [DailyScrum]
    
    @State private var showAlert = false
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    @State private var alertMessage = ""
    
    func containTitle(name: String) -> Bool{
        return scrums.contains{ scrums in
            return scrums.title == name
        }
    }
    
    var body: some View {
        List {
            Section(header: Text("Title")) {
                Text(scrum.title)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                      Label("Theme", systemImage: "paintpalette")
                      Spacer()
                      Text(scrum.theme.name)
                          .padding(4)
                          .foregroundColor(scrum.theme.accentColor)
                          .background(scrum.theme.mainColor)
                          .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Detail")) {
                Text(scrum.detail)
            }
        }
        .navigationTitle("To do")
        .toolbar {
             Button("Edit") {
                 isPresentingEditView = true
                 editingScrum = scrum
             }
         }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle("Edit")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                               Button("Done") {
                                   if containTitle(name: editingScrum.title){
                                       showAlert = true
                                       alertMessage = "It is already exit"
                                   }else if editingScrum.title.isEmpty {
                                       showAlert = true
                                       alertMessage = "Please Write Title"
                                   }else {
                                       isPresentingEditView = false
                                       scrum = editingScrum
                                   }
                               }
                               .alert(isPresented: $showAlert) {
                                   Alert(
                                    title: Text("Current Action Not Available"),
                                    message: Text(alertMessage)
                                   )
                               }
                           }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]), scrums: .constant(DailyScrum.sampleData))
    }
}
