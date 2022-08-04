//
//  DateGridView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import SwiftUI

struct DateGridView: View {
    var body: some View {
        VStack {
            HStack {
                Text("M")
                Text("T")
                Text("W")
                Text("T")
                Text("F")
                Text("S")
                Text("S")
            }
        }
        
    }// body
}// DateGridView

struct DateGridView_Previews: PreviewProvider {
    static var previews: some View {
        DateGridView()
    }
}
