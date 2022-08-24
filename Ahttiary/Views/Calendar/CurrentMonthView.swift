//
//  CurrentMonthView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/03.
//

import SwiftUI

struct CurrentMonthView: View {
    @EnvironmentObject var dateManager: DateViewModel
    var currentYearAndMonth: String {
        let components = Calendar.current.dateComponents([.year, .month], from: dateManager.date)
        let year = components.year
        let month = components.month
        
        return "\(year!)년 \(month!)월"
    }
    
    var body: some View {
        HStack {
//            Button {
//                dateManager.fetchPreviousMonth()
//            } label: {
//                Image(systemName: "chevron.left")
//            }

            Text(currentYearAndMonth)
                .font(.custom(Font.calendarBold, size: 22))
            
//            Button {
//                dateManager.fetchNextMonth()
//            } label: {
//                Image(systemName: "chevron.right")
//            }
        }
    }// body
    
}// CurrentMonthView

struct CurrentMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentMonthView()
    }
}
