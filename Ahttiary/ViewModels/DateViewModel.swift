//
//  DateViewModel.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import Foundation

final class DateViewModel: ObservableObject {
    @Published var date: Date = Date()

    func addMonth() {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: 1, to: date) else { return }

        self.date = changedMonth
    }

    func minusMonth() {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: -1, to: date) else { return }
        
        self.date = changedMonth
    }

}// DateViewModel
