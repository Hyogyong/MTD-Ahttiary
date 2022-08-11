//
//  WriteNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WriteNoteView: View {
    
    @ObservedObject var noteManager: NoteManager = NoteManager()
    @ObservedObject var note: Note
    
    var body: some View {
        switch noteManager.pageNumber {
            
        case 0:
            // 상황
            WritePageView(noteManager: noteManager, answer: $note.firstAnswer)
            
        case 1:
            // 정서
            WritePageView(noteManager: noteManager, answer: $note.secondAnswer)
            
        case 2:
            // 감정 체크 및 다이어리 추가 작성 여부 선택
            CheckPageView(noteManager: noteManager, isWritingFinished: false)
            
        case 3:
            // 자동적 사고 기술
            WritePageView(noteManager: noteManager, answer: $note.thirdAnswer)
            
        case 4:
            // 인지 왜곡 파악
            WritePageView(noteManager: noteManager, answer: $note.fourthAnswer)
            
        case 5:
            // 합리적 반응 도출
            WritePageView(noteManager: noteManager, answer: $note.fifthAnswer)
            
        case 6:
            // 감정 체크 및 페이지 넘어가기
            CheckPageView(noteManager: noteManager, isWritingFinished: true)
            
        case 7:
            // 마지막 페이지(내일도 즐거운 하루 보내자!)
            EndPageView(noteManager: noteManager)
            
        default:
            // ErrorPageView()
            EmptyView()
        }
    } // End of body
}
