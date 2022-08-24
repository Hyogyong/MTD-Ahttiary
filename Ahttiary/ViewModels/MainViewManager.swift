//
//  MainViewManager.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/18.
//

import Foundation
import SwiftUI

final class MainViewManager: ObservableObject {
    @Published var pageName: PageName = .main
    @Published var note: FetchedResults<Note>.Element? = nil
    
    func goToMainView() {
        withAnimation {
            pageName = .main
        }
    }

    func goToWritingView() {
        withAnimation {
            pageName = .writing
        }
    }
    
    func goToReadingView() {
        withAnimation {
            pageName = .reading
        }
    }
        
    func updateNote(_ data: FetchedResults<Note>.Element?) { self.note = data }
    
    func createNote(_ createdDate: Date = Date()) -> some View {
        print("🔥 해당 날짜로 다이어리가 생성됩니다: \(createdDate)")

        let newNote = Note.getNewNote()
        return WriteNoteView(note: newNote)
    }
    
}// MainViewManager

enum PageName {
    case main
    case writing
    case reading
}
