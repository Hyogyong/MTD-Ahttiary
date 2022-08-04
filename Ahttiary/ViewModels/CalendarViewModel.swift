//
//  CalendarViewModel.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import Foundation

final class CalendarViewModel {
    let calendar = Calendar.current
    
    // 해당월의 일 수를 Int(Optional)형으로 반환합니다.
    func totalDaysInMonth(_ date: Date) -> Int? {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return nil }
        return range.count
    }
}
