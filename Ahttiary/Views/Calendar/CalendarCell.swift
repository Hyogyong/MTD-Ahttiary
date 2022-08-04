//
//  CalendarCell.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//
// 캘린더에 표시될 각각의 날짜 셀 입니다.

import SwiftUI

struct CalendarCell: View {
    @EnvironmentObject var dateManager: DateViewModel
    let count: Int
    let startingSpaces: Int
    let totalDaysInMonth: Int
    let totalDaysInPreviousMonth: Int
    
    var body: some View {
        Text(monthStruct().day())
            .foregroundColor(textColor(type: monthStruct().monthType))
    }// body
    
    private func monthStruct() -> MonthStruct {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        
        if (count <= start) {
            let day = totalDaysInPreviousMonth + count - start
            
            return MonthStruct(monthType: .previous, dayInt: day)
        } else if (count - start > totalDaysInMonth) {
            let day = count - start - totalDaysInMonth
            
            return MonthStruct(monthType: .next, dayInt: day)
        }
        
        let day = count - start
        
        return MonthStruct(monthType: .current, dayInt: day)
    }
    
    private func textColor(type: MonthType) -> Color {
        if type == .current { return .black }
        return .gray
    }
    
}// CalendarCell

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(
            count: 1,
            startingSpaces: 1,
            totalDaysInMonth: 1,
            totalDaysInPreviousMonth: 1
        )
    }
}
