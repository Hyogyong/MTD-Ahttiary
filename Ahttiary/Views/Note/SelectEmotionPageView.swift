//
//  SelectHappinessLevelPageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/06.
//

import SwiftUI

struct SelectEmotionPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @EnvironmentObject var dateManager: DateViewModel
    @Binding var answer: String
    @FocusState var isTextFieldsFocused: Bool
    
    let imageName: String
    
    var body: some View {
        VStack {
            CustomNavigationBar(displayDate: dateManager.selectedDate)
                .padding()
            
            // 아띠와 말풍선
            HStack(alignment: .center) {
                Text(noteManager.randomComments[noteManager.pageNumber])
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.Custom.background)
                    .font(.custom(Font.Custom.comment, size: 20))
                    .padding()
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                    .scaleEffect(CGSize(width: -1.0, height: 1.0))
            }
            
            // Emotion Selecting Buttons
            HStack {
                Button {
                    answer = Emotion.anger.rawValue
                } label: {
                    Text("😡")
                        .font(.largeTitle)
                }
                .opacity(answer == "anger" ? 1 : 0.5)
                
                Button {
                    answer = Emotion.sad.rawValue
                } label: {
                    Text("😢")
                        .font(.largeTitle)
                }
                .opacity(answer == "sad" ? 1 : 0.5)
                
                Button {
                    answer = Emotion.tired.rawValue
                } label: {
                    Text("🫠")
                        .font(.largeTitle)
                }
                .opacity(answer == "tired" ? 1 : 0.5)
                
                Button {
                    answer = Emotion.worried.rawValue
                } label: {
                    Text("😮‍💨")
                        .font(.largeTitle)
                }
                .opacity(answer == "worried" ? 1 : 0.5)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                CustomButton("이전") {
                    noteManager.goToPreviousPage()
                }
                
                CustomButton("선택 완료") {
                    noteManager.goToNextPage()
                }
                .disabled(answer.isEmpty)
                .opacity(answer.isEmpty ? 0.7 : 1)
            }
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
