//
//  MainView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewManager: MainViewManager
    var buttonText: String {
        if mainViewManager.note == nil { return "감정기록 시작하기" }
        return "감정 읽기"
    }
    
    var body: some View {
        VStack {
            CalendarView()
                .padding(.vertical)
            
            HStack (alignment: .center) {
                Image("ahttyHello")
                    .resizable()
                    .frame(width: 168, height: 135)
                
                Spacer()
                
                Text(Comment.mainComment[Int.random(in: 0..<Comment.mainComment.count)])
                    .font(.custom(Font.shared.comment, size: 20))
            }
            .padding(.horizontal, 36)
            .padding(.bottom, 90)
            
            Button {
                if mainViewManager.note == nil { mainViewManager.goToWritingView() }
                else { mainViewManager.goToReadingView() }
            } label: {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Custom.carrotGreen)
                    
                    Text(buttonText)
                        .font(.custom(Font.shared.calendarBold, size: 20))
                        .foregroundColor(.white)
                }
                .frame(minWidth: 250, maxHeight: 50)
            }
            .padding(.horizontal, 70)
            .padding(.bottom, 32)
            
        }// VStack
        .padding(.horizontal, 20)
        .background(Color.Custom.background)
    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
