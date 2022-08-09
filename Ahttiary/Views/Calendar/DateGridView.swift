//
//  DateGridView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import SwiftUI

struct DateGridView: View {
    @EnvironmentObject var dateManager: DateViewModel
    
    var body: some View {
        VStack {
            dayOfWeek
            calendarGrid
        }
    }// body
    
    private var dayOfWeek: some View {
        HStack (spacing: 1) {
            Text("S").expandHorizontally()
            Text("M").expandHorizontally()
            Text("T").expandHorizontally()
            Text("W").expandHorizontally()
            Text("T").expandHorizontally()
            Text("F").expandHorizontally()
            Text("S").expandHorizontally()
        }
    }// dayOfWeek
    
    private var calendarGrid: some View {
        VStack (spacing: 1) {
            let totalDaysInMonth = CalendarViewModel().totalDaysInMonth(dateManager.date)
            let theFirstDayOfMonth = CalendarViewModel().theFirstDayOfMonth(dateManager.date)
            let startingSpaces = CalendarViewModel().weekDay(theFirstDayOfMonth!)
            let previousMonth = CalendarViewModel().minusMonth(dateManager.date)
            let totalDaysInPreviousMonth = CalendarViewModel().totalDaysInMonth(previousMonth!)

            ForEach(0..<6) { row in
                HStack (spacing: 1) {
                    ForEach(1..<8) { column in
                        let count = column + (row * 7)
                        if let totalDaysInMonth = totalDaysInMonth,
                           let startingSpaces = startingSpaces,
                           let totalDaysInPreviousMonth = totalDaysInPreviousMonth {
                            CalendarCell(
                                count: count,
                                startingSpaces: startingSpaces,
                                totalDaysInMonth: totalDaysInMonth,
                                totalDaysInPreviousMonth: totalDaysInPreviousMonth
                            )
                            .environmentObject(dateManager)
                        }
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }// calendarGrid
        
}// DateGridView

struct DateGridView_Previews: PreviewProvider {
    static var previews: some View {
        DateGridView()
    }
}
