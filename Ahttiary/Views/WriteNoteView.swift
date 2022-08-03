//
//  WriteNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WriteNoteView: View {
    @ObservedObject var noteManager: NoteManager = NoteManager()
    
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
                ZStack {
                    TextEditor(text: $noteManager.answers[noteManager.pageNumber])
                        .frame(
                            height: ScreenSize.answerMessageBoxHeight
                        )
                        .cornerRadius(15)
                        .padding()
                }
            }
            
            HStack {
                Button("이전") {
                    noteManager.goToPreviousPage()
                }
                .buttonStyle(.bordered)
                Button("다음") {
                    noteManager.goToNextPage()
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
        }
        .background(Color.Custom.backgroundColor.ignoresSafeArea())
    }
}

struct WriteNoteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteNoteView()
    }
}
