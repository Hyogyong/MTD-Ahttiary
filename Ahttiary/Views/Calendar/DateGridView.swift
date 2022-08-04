//
//  DateGridView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import SwiftUI

struct DateGridView: View {
    @EnvironmentObject var dateManager: DateViewModel
    
    var body: some View {
        VStack {
            dayOfWeek
            calendarGrid
        }
    }// body
    
    private var dayOfWeek: some View {
        HStack (spacing: 1) {
            Text("M").dayOfWeek()
            Text("T").dayOfWeek()
            Text("W").dayOfWeek()
            Text("T").dayOfWeek()
            Text("F").dayOfWeek()
            Text("S").dayOfWeek()
            Text("S").dayOfWeek()
        }
    }// dayOfWeek
    
    private var calendarGrid: some View {
        VStack (spacing: 1) {
            Text("Hello")
        }
    }// calendarGrid
        
}// DateGridView

struct DateGridView_Previews: PreviewProvider {
    static var previews: some View {
        DateGridView()
    }
}
