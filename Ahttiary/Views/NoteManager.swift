//
//  NoteManager.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import Foundation

final class NoteManager: ObservableObject {
    var answers: [String] = ["첫 번째 대답", "두 번째 대답"]
    @Published var pageNumber: Int = 0
    
    static let questions: [String] = [
        """
        이전에 느꼈던 감정을 다시
        떠올리곤 해. 만약 다르게
        받아들였다면 나는 달라졌을까?
        오늘 너에게는 어떤 일이 있었니?
        """,
        """
        그런 일이 있었구나,
        어떤 기분이 들었니?
        얼마나 큰 영향을 미쳤니?
        """,
        
    ]
    
    func goToNextPage() {
        if pageNumber != NoteManager.questions.count - 1 {
            pageNumber += 1
        }
    }
    
    func goToPreviousPage() {
        if pageNumber != 0 {
            pageNumber += -1
        }
    }
}
