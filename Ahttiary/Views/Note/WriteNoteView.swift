//
//  WriteNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WriteNoteView: View {
    @ObservedObject var noteManager: NoteManager = NoteManager()
    @StateObject private var draftNote: DraftNote
    
    init(note: Note) {
        _draftNote = StateObject(wrappedValue: DraftNote(note: note))
    }
    
    var body: some View {
        
        TabView(selection: $noteManager.pageNumber) {
            // 상황
            WritePageView(
                noteManager: noteManager,
                answer: $draftNote.firstAnswer,
                imageName: "noteAhtty"
            ).tag(0)
            
            // 정서
            WritePageView(
                noteManager: noteManager,
                answer: $draftNote.secondAnswer,
                imageName: "bbaeggomAhtty"
            ).tag(1)
            
            // 첫 번째 감정 체크
            SelectEmotionPageView(
                noteManager: noteManager,
                answer: $draftNote.firstEmotion,
                imageName: "selectinAhtty"
            ).tag(2)
            
            // 자동적 사고 기술
            WritePageView(
                noteManager: noteManager,
                answer: $draftNote.thirdAnswer,
                imageName: "questionAhtty"
            ).tag(3)
            
            // 인지 왜곡 파악
            SelectCognitiveDistortionPageView(
                noteManager: noteManager,
                answer: $draftNote.fourthAnswer,
                imageName: "helloAhtty"
            ).tag(4)
            
            // 합리적 반응 도출
            WritePageView(
                noteManager: noteManager,
                answer: $draftNote.fifthAnswer,
                imageName: "thinkinAhtty"
            ).tag(5)
            
            // 두 번째 감정 체크
            SelectEmotionPageView(
                noteManager: noteManager,
                answer: $draftNote.secondEmotion,
                imageName: "selectinAhtty"
            ).tag(6)
            
            // 마지막 페이지(내일도 즐거운 하루 보내자!)
            EndPageView(
                noteManager: noteManager,
                imageName: "helloAhtty"
            ).tag(7)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .background(Color.Custom.background)
        .onChange(of: noteManager.pageNumber) { _ in
            Note.updateNote(using: draftNote)
        }

    } // End of body
}// WriteNoteView
