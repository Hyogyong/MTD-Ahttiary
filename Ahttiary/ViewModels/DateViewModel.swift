//
//  DateViewModel.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import Foundation

final class DateViewModel: ObservableObject {
    @Published var date: Date = Date()
    @Published var selectedDate: Date = Date()
    
    func fetchPreviousMonth() {
        guard let previousMonth = CalendarViewModel().getPreviousMonth(date) else { return }
        date = previousMonth
    }
    
    func fetchNextMonth() {
        guard let nextMonth = CalendarViewModel().getNextMonth(date) else { return }
        date = nextMonth
    }
    
    func updateSelectedDate(_ selectedDay: Int) {
        let originalDay = Calendar.current.dateComponents([.day], from: date).day!
        guard let changedDate = Calendar.current.date(byAdding: .day, value: selectedDay - originalDay, to: date) else { return }
        print("✅ 캘린더에서 선택된 날짜: \(changedDate)")
        self.selectedDate = changedDate
    }
    
    func verifyFutureDate(_ today: Int) -> Bool {
        let globalDate: Date = Date()
        let componentsOfGlobalDate = Calendar.current.dateComponents([.year, .month, .day], from: globalDate)
        let componentsOfCurrentDate = Calendar.current.dateComponents([.year, .month, .day], from: date)
        
        if componentsOfCurrentDate.year! > componentsOfGlobalDate.year! { return true }
        if componentsOfCurrentDate.month! > componentsOfGlobalDate.month! { return true }
        if componentsOfCurrentDate.month! == componentsOfGlobalDate.month! &&
           today > componentsOfGlobalDate.day!
        { return true }
        
        return false
    }
    
    func verifySelectedDay(_ today: Int) -> Bool {
        let currentYear = Calendar.current.dateComponents([.year], from: date).year!
        let currentMonth = Calendar.current.dateComponents([.month], from: date).month!
        let selectedYear = Calendar.current.dateComponents([.year], from: selectedDate).year!
        let selectedMonth = Calendar.current.dateComponents([.month], from: selectedDate).month!
        let selectedDay = Calendar.current.dateComponents([.day], from: selectedDate).day!

        if currentYear == selectedYear &&
           currentMonth == selectedMonth &&
           selectedDay == today {
             return true
        }
        
        return false
    }

}// DateViewModel
