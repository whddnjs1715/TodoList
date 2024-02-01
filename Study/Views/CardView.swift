//
//  CardView.swift
//  Study
//
//  Created by whddnjs1715 on 28/1/24.
//

import SwiftUI


struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            Text(scrum.detail)
                .padding(.trailing, 20)
                .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}


struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
