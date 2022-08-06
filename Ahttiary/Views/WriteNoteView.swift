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
        switch noteManager.pageNumber {
            
        case 0...1:
            // 상황, 정서
            WritePageView(noteManager: noteManager)
            
        case 2:
            // 감정 체크 및 다이어리 추가 작성 여부 선택
            CheckPageView(noteManager: noteManager, isWritingFinished: false)
            
        case 3...5:
            // 다이어리 추가 작성 (자동적 사고 기술, 인지 왜곡 파악, 합리적 반응 도출)
            WritePageView(noteManager: noteManager)
            
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
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WriteNoteView()
    }
}
