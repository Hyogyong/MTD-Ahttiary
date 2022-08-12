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
    static let shared = DateViewModel()
    
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
    
}// DateViewModel
