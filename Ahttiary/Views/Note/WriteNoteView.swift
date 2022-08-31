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
        Group {
            switch noteManager.pageNumber {
            case 0:
                WritePageView(
                    noteManager: noteManager,
                    answer: $draftNote.firstAnswer,
                    imageName: "noteAhtty"
                )
            case 1:
                WritePageView(
                    noteManager: noteManager,
                    answer: $draftNote.secondAnswer,
                    imageName: "bbaeggomAhtty"
                )
            case 2:
                SelectEmotionPageView(
                    noteManager: noteManager,
                    answer: $draftNote.firstEmotion,
                    imageName: "selectinAhtty"
                )
            case 3:
                WritePageView(
                    noteManager: noteManager,
                    answer: $draftNote.thirdAnswer,
                    imageName: "questionAhtty"
                )
            case 4:
                SelectCognitiveDistortionPageView(
                    noteManager: noteManager,
                    answer: $draftNote.fourthAnswer,
                    imageName: "helloAhtty"
                )
            case 5:
                // 합리적 반응 도출
                WritePageView(
                    noteManager: noteManager,
                    answer: $draftNote.fifthAnswer,
                    imageName: "thinkinAhtty"
                )
            case 6:
                // 두 번째 감정 체크
                SelectEmotionPageView(
                    noteManager: noteManager,
                    answer: $draftNote.secondEmotion,
                    imageName: "selectinAhtty"
                )
            case 7:
                // 마지막 페이지(내일도 즐거운 하루 보내자!)
                EndPageView(
                    noteManager: noteManager,
                    imageName: "helloAhtty"
                )
            default:
                EmptyView()
            }
        }
        .background(Color.Custom.background)
        .onChange(of: noteManager.pageNumber) { _ in
                Note.updateNote(using: draftNote)
        }
        .onDisappear {
            Note.updateNote(using: draftNote)
        }
    } // End of body
} // WriteNoteView
