//
//  DraftNote.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation

class DraftNote: ObservableObject {
    
    var id: UUID? = nil
    @Published var dateCreated = Date()
    @Published var firstAnswer = ""
    @Published var secondAnswer = ""
    @Published var thirdAnswer = ""
    @Published var fourthAnswer = ""
    @Published var fifthAnswer = ""
    
    init(note: Note) {
        id = note.id
        dateCreated = note.dateCreated
        firstAnswer = note.firstAnswer
        secondAnswer = note.secondAnswer
        thirdAnswer = note.thirdAnswer
        fourthAnswer = note.fourthAnswer
        fifthAnswer = note.fifthAnswer
    }
    
    var associatedNote: Note { Note.object(withID: id!)! }
}
