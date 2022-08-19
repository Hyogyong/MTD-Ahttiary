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
    @Published var firstHappinessLevel: Int16 = 3
    @Published var secondHappinessLevel: Int16 = 3
    
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
        firstHappinessLevel = note.firstHappinessLevel
        secondHappinessLevel = note.secondHappinessLevel
    }
    
    var associatedNote: Note { Note.object(withID: id!)! }
}
