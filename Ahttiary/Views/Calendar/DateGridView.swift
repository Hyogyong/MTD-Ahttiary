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
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ value in
            if value.translation.width < 0 { dateManager.fetchNextMonth() }
            if value.translation.width > 0 { dateManager.fetchPreviousMonth() }
        }))
    }// body
    
    private var dayOfWeek: some View {
        HStack (spacing: 1) {
            Group {
                Text("일").expandHorizontally()
                Text("월").expandHorizontally()
                Text("화").expandHorizontally()
                Text("수").expandHorizontally()
                Text("목").expandHorizontally()
                Text("금").expandHorizontally()
                Text("토").expandHorizontally()
            }
            .font(.custom(Font.shared.calendarBold, size: 20))
        }
    }// dayOfWeek
    
    private var calendarGrid: some View {
        VStack (spacing: 1) {
            let totalDaysInMonth = CalendarViewModel().totalDaysInMonth(dateManager.date)
            let theFirstDayOfMonth = CalendarViewModel().theFirstDayOfMonth(dateManager.date)
            let startingPosition = CalendarViewModel().weekDay(theFirstDayOfMonth!)
            let previousMonth = CalendarViewModel().getPreviousMonth(dateManager.date)
            let totalDaysInPreviousMonth = CalendarViewModel().totalDaysInMonth(previousMonth!)
            
            ForEach(0..<6) { row in
                HStack (spacing: 1) {
                    ForEach(1..<8) { column in
                        let count = column + (row * 7)
                        if let totalDaysInMonth = totalDaysInMonth,
                           let startingPosition = startingPosition,
                           let totalDaysInPreviousMonth = totalDaysInPreviousMonth {
                            CalendarCell(
                                count: count,
                                startingPosition: startingPosition,
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
