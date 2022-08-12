//
//  CalendarView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        CurrentMonthView()
            .padding(.top, 71)
        DateGridView()
            .onAppear {
                print("Hello")
            }

    }// body
}// CalendarView

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
