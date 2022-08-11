//
//  DateFormatter+Extensions.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import Foundation

extension DateFormatter {
    static func getKoreanDateInString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        return dateFormatter.string(from: Date.now)
    }
    
    static func convertToKoreanDate(date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        return dateFormatter.string(from: date)
    }
}
