//
//  DraftNote.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation

class DraftNote: ObservableObject {
    
    var id: UUID? = nil
    @Published var dateCreated: Date = Date()
    @Published var firstAnswer: String = ""
    @Published var secondAnswer: String = ""
    @Published var thirdAnswer: String = ""
    @Published var fourthAnswer: String = ""
    @Published var fifthAnswer: String = ""
    @Published var firstEmotion: String = ""
    @Published var secondEmotion: String = ""
    
    var displayedDate: String {
        dateCreated.convertToDisplayedDate()
    }
    
    init(note: Note) {
        id = note.id
        dateCreated = note.dateCreated
        firstAnswer = note.firstAnswer
        secondAnswer = note.secondAnswer
        thirdAnswer = note.thirdAnswer
        fourthAnswer = note.fourthAnswer
        fifthAnswer = note.fifthAnswer
        firstEmotion = note.firstEmotion
        secondEmotion = note.secondEmotion
    }
    
    var associatedNote: Note { Note.object(withID: id!)! }
}
