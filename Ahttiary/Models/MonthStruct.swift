//
//  MonthStruct.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import Foundation

struct MonthStruct {
    let monthType: MonthType
    let dayInt: Int
    let monthInfo = Calendar.current.dateComponents([.month], from: Date.now).month
    let yearInfo = Calendar.current.dateComponents([.year], from: Date.now).year

    func day() -> String {
        return String(dayInt)
    }
    
    func month() -> String? {
        guard let monthInfo = self.monthInfo else { return nil }
        return String(monthInfo)
    }
    
    func year() -> String? {
        guard let yearInfo = self.yearInfo else { return nil }
        return String(yearInfo)
    }
}

enum MonthType {
    case previous
    case current
    case next
}
