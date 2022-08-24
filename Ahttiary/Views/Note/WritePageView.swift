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
            CustomNavigationBar(displayDate: Date())
                .padding()
            
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
                    .frame(maxWidth: .infinity)
                    .font(.custom(Font.Custom.comment, size: 20))
            }
            .padding(.horizontal)
            
            // 노트 작성란
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .overlay {
                    TextEditor(text: $answer)
                        .font(.custom(Font.Custom.comment, size: 20))
                        .focused($isTextFieldsFocused)
                        .accentColor(Color.Custom.carrotGreen)
                        .padding()
                }
                .padding()

            // 페이지 전환 버튼
            HStack(spacing: 20) {
                CustomButton("이전") { noteManager.goToPreviousPage() }
                CustomButton("다음") { noteManager.goToNextPage() }
                .disabled(answer.isEmpty)
                .opacity(answer.isEmpty ? 0.7 : 1)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Custom.background.ignoresSafeArea())
        .onTapGesture { isTextFieldsFocused = false }
        .onAppear { UITextView.appearance().backgroundColor = .clear }
    }
}

/*
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
*/
