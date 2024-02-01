//
//  DailyScrum.swift
//  Study
//
//  Created by whddnjs1715 on 28/1/24.
//

import Foundation
 
struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var detail: String
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, detail: String, theme: Theme) {
        self.id = id
        self.title = title
        self.detail = detail
        self.theme = theme
    }
}

extension DailyScrum {
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", detail: "", theme: .sky)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Reading a book",
                   detail: "Two books",
                   theme: .yellow),
        DailyScrum(title: "Programming",
                   detail: "Swift, Javaciprt, programmeres",
                   theme: .orange),
        DailyScrum(title: "Studting Spainish",
                   detail: "Spanish Study",
                   theme: .poppy)
    ]
}
