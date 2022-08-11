//
//  DateViewModel.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import Foundation

final class DateViewModel: ObservableObject {
    @Published var date: Date = Date()
    
    func fetchPreviousMonth() {
        guard let previousMonth = CalendarViewModel().getPreviousMonth(date) else { return }
        date = previousMonth
    }
    
    func fetchNextMonth() {
        guard let nextMonth = CalendarViewModel().getNextMonth(date) else { return }
        date = nextMonth
    }
}// DateViewModel
