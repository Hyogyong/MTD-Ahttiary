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
        
        TabView(selection: $noteManager.pageNumber) {
            // 상황
            WritePageView(noteManager: noteManager, answer: $note.firstAnswer)
                .tag(0)
            
            // 정서
            WritePageView(noteManager: noteManager, answer: $note.secondAnswer)
                .tag(1)
            
            // 감정 체크 및 다이어리 추가 작성 여부 선택
            CheckPageView(noteManager: noteManager, isWritingFinished: false)
                .tag(2)
            
            // 자동적 사고 기술
            WritePageView(noteManager: noteManager, answer: $note.thirdAnswer)
                .tag(3)
            
            // 인지 왜곡 파악
            WritePageView(noteManager: noteManager, answer: $note.fourthAnswer)
                .tag(4)
            
            // 합리적 반응 도출
            WritePageView(noteManager: noteManager, answer: $note.fifthAnswer)
                .tag(5)
            
            // 감정 체크 및 페이지 넘어가기
            CheckPageView(noteManager: noteManager, isWritingFinished: true)
                .tag(6)
            
            // 마지막 페이지(내일도 즐거운 하루 보내자!)
            EndPageView(noteManager: noteManager)
                .tag(7)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            PersistentStore.shared.saveContext()
            noteManager.goToFirstPage()
        }
        
    } // End of body
}
