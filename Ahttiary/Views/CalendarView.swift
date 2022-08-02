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

    }// body
}// CalendarView

struct CurrentMonthView: View {
    
    @EnvironmentObject var dateManager: DateViewModel
    
    var body: some View {
        VStack {
            Text("\(dateManager.date)")
            Text("Hello")
            Text("Hello")
        }

    }// body
}// CurrentMonthView

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
