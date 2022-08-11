//
//  MainView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            
            HStack {
                Image("ahtty")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("안녕")
                    .padding()
            }
                
            CalendarView()
                .padding(.vertical)
            
            Spacer()
        }
        // General View Setting
        .padding(.horizontal)

    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
