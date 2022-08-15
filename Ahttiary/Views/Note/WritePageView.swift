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
                Image("AhttyWriter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                
                Text(NoteManager.questions[noteManager.pageNumber])
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
            }
            
            HStack {
                Text(DateFormatter.getKoreanDateInString())
                
                Spacer()
                
                Text("맑음")
            }
            .padding(.horizontal)
            .font(.callout)
            .foregroundColor(.gray)
            
            // 노트 작성란
            HStack {
                TextEditor(text: $answer)
                    .frame(
                        height: ScreenSize.answerMessageBoxHeight
                    )
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
                    .focused($isTextFieldsFocused)
            }
            
            HStack {
                Button("이전") {
                    noteManager.goToPreviousPage()
                }
                
                Button("다음") {
                    noteManager.goToNextPage()
                }
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
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
