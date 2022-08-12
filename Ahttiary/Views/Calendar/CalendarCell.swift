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
    let startingPosition: Int
    let totalDaysInMonth: Int
    let totalDaysInPreviousMonth: Int
    
    var body: some View {
        if fetchMonthStruct().monthType == .current {
            ZStack {
                Circle()
                    .foregroundColor(verifyCurrentDay() ? Color.Custom.carrotGreen : .clear)

                Text(fetchMonthStruct().day())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(
                        verifyCurrentDay()
                        ? .white
                        : verifyFutureDay()
                            ? .gray
                            : .black
                    )
                    .onTapGesture { print(fetchMonthStruct().day()) }
                    .disabled(verifyFutureDay())
            }
        } else {
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }// body
    
    private func fetchMonthStruct() -> MonthStruct {
        if (count <= startingPosition) {
            let day = totalDaysInPreviousMonth + count - startingPosition
            
            return MonthStruct(monthType: .previous, dayInt: day)
        } else if (count - startingPosition > totalDaysInMonth) {
            let day = count - startingPosition - totalDaysInMonth
            
            return MonthStruct(monthType: .next, dayInt: day)
        }
        
        let day = count - startingPosition
        
        return MonthStruct(monthType: .current, dayInt: day)
    }
    
    private func verifyCurrentDay() -> Bool {
        let date = dateManager.date
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)

        if components.year == fetchMonthStruct().yearInfo! &&
           components.month == fetchMonthStruct().monthInfo! &&
           components.day == fetchMonthStruct().dayInt {
             return true
        }
        
        return false
    }
    
    private func verifyFutureDay() -> Bool {
        let date = dateManager.date
        let components = Calendar.current.dateComponents([.day], from: date)
        
        if components.day! < fetchMonthStruct().dayInt { return true }
        return false
    }
    
}// CalendarCell

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(
            count: 1,
            startingPosition: 1,
            totalDaysInMonth: 1,
            totalDaysInPreviousMonth: 1
        )
    }
}
