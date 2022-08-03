//
//  CurrentMonthView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/03.
//

import SwiftUI

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

struct CurrentMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentMonthView()
    }
}
