//
//  NoteManager.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import Foundation

final class NoteManager: ObservableObject {
    
    @Published var pageNumber: Int = 0
    
    // pageNumber에 맞는 페이지의 질문을 쉽게 불러오기 위한 변수입니다.
    var questionInPresentPage: String { NoteManager.questions[pageNumber] }
    
    static let questions: [String] = [
        // 0. 상황 서술
        """
        이전에 느꼈던 감정을 다시
        떠올리곤 해. 만약 다르게
        받아들였다면 나는 달라졌을까?
        오늘 너에게는 어떤 일이 있었니?
        """,
        // 1. 감정 서술
        """
        그런 일이 있었구나,
        어떤 기분이 들었니?
        얼마나 큰 영향을 미쳤니?
        """,
        // 2. 첫번째 감정 인식
        """
        감정 선택 페이지 1
        """,
        // 3. 자동적 사고
        """
        자동적 사고
        """,
        // 4. 인지 왜곡 파악
        """
        인지 왜곡 파악
        """,
        // 5. 합리적 반응 도출
        """
        합리적 반응 도출
        """,
        // 6. 두번째 감정 인식
        """
        감정 선택 페이지 2
        """,
        // 7. 마지막 페이지
        """
        멘트 후 종료
        """
    ]
    
    func goToNextPage() {
        let lastPageNumber = NoteManager.questions.count - 1
        
        if pageNumber != lastPageNumber {
            pageNumber += 1
        }
    }
    
    func goToPreviousPage() {
        if pageNumber != 0 {
            pageNumber += -1
        }
    }
    
    func goToFirstPage() {
        pageNumber = 0
    }
    
    func goToLastPage() {
        let lastPageNumber = NoteManager.questions.count - 1
        
        pageNumber = lastPageNumber
    }
}
