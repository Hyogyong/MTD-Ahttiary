//
//  DateGridView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import SwiftUI

struct DateGridView: View {
    @EnvironmentObject var dateManager: DateViewModel
    @State private var locationOfGrid: CGFloat = 0
    
    var body: some View {
        VStack {
            dayOfWeek
            calendarGrid
                .offset(x: locationOfGrid)
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged {
                locationOfGrid = $0.translation.width
            }
            .onEnded {
                if $0.translation.width < 0 { dateManager.fetchNextMonth() }
                if $0.translation.width > 0 { dateManager.fetchPreviousMonth() }
                locationOfGrid = 0
            }
        )
    }// body
    
    private var dayOfWeek: some View {
        HStack (spacing: 1) {
            Text("일").weekDayViewModifier()
            Text("월").weekDayViewModifier()
            Text("화").weekDayViewModifier()
            Text("수").weekDayViewModifier()
            Text("목").weekDayViewModifier()
            Text("금").weekDayViewModifier()
            Text("토").weekDayViewModifier()
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
