//
//  SelectHappinessLevelPageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/06.
//

import SwiftUI

struct SelectHappinessLevelPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @Binding var answer: Int16
    
    var answerInFloat: Binding<Double> {
        Binding<Double>(
            get: { return Double(answer) },
            set: { answer = Int16($0) }
        )
    }
    
    @FocusState var isTextFieldsFocused: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            // 아띠와 말풍선
            HStack(alignment: .center) {
                Text(noteManager.questionInPresentPage)
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.Custom.background)
                    .font(.custom(Font.shared.comment, size: 20))
                    .padding()
                
                Image("ahttyHello")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                    .scaleEffect(CGSize(width: -1.0, height: 1.0))
            }
            
            Slider(
                value: answerInFloat,
                in: 1...5
            )
            
            Text("\(answer)")
            
            HStack(spacing: 20) {
                CustomButton("이전") {
                    noteManager.goToPreviousPage()
                }
                
                CustomButton("선택 완료") {
                    noteManager.goToNextPage()
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Custom.background.ignoresSafeArea())
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button {
                    isTextFieldsFocused = false
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
                
            }
        }
    }
}
