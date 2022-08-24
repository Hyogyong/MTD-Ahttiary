//
//  WritePageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WritePageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @Binding var answer: String
    
    @FocusState var isTextFieldsFocused: Bool
    
    var body: some View {
        VStack {
            // 아띠와 말풍선
            HStack(alignment: .center) {
                Image("ahttyHello")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                
                Text(noteManager.randomComments[noteManager.pageNumber])
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.Custom.background)
                    .font(.custom(Font.shared.comment, size: 20))
                    .padding()
            }
            
            // 노트 작성란
            HStack {
                TextEditor(text: $answer)
                    .frame(
                        height: ScreenSize.answerMessageBoxHeight
                    )
                    .background(Color.white)
                    .font(.custom(Font.shared.comment, size: 20))
                    .cornerRadius(15)
                    .padding()
                    .focused($isTextFieldsFocused)
            }
            
            HStack(spacing: 20) {
                CustomButton("이전") {
                    noteManager.goToPreviousPage()
                }
                
                CustomButton("다음") {
                    noteManager.goToNextPage()
                }
                .disabled(answer.isEmpty)
                .opacity(answer.isEmpty ? 0.7 : 1)
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
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}
