//
//  Comment.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/12.
//

import Foundation

struct Comment {
    // 메인
    static let mainComment: [String] = [
        """
        기다리던 시간이야!
        오늘의 감정기록을 만들어보자.
        """
    ]
    
    // 상황
    static let situationComment: [String] = [
        "좋아 기록을 시작해보자. 오늘은 어떤 일이 있었니?",
        "감정을 기록해보자! 무슨 일이 있었는지 말해줄래?",
        "기분 나쁜 일이 있었니? 무슨 일이었는지 알려줄래?",
        "나를 찾아와줘서 기뻐! 너의 하루를 알려줘!"
    ]
        
    // 정서
    static let sentimentComment: [String] = [
        "그런 일이 있었구나. 어떤 감정이 들었니?",
        "그런 일이 있었구나. 당시에 어떤 기분이었니?",
        "음. 그렇구나. 그 상황에 대한 너의 감정을 알려줄래?",
        "너에게 있었던 일을 알려줘서 고마워. 그 때 어떤 기분이 들었어?"
    ]
    
    // 이모티콘 선택
    static let selectEmoticonComment: String = "너의 정서를 표현하는 표정을 골라줘."
    
    // 자동적 사고: 1차 이모티콘 선택 이후
    static let unconsciousnessComment: [String] = [
        "이모티콘 이름을 선택했구나. 어떤 이유에서 골랐는지 말해줄래?",
        "나도 가끔 “이모티콘 이름”을 선택해. 너는 어떤 생각을 하면서 골랐니?",
        "이모티콘 이름을 고르면서 떠오른 생각은 무엇인지 알고 싶어.",
        "어떤 생각이 너에게 이모티콘 이름를 고르게 했니?"
    ]
    
    // 인지 왜곡 선택
    static let cognitiveDistortionComment: [String] = [
        "앞에서 적은 내용은 어떤 인지왜곡에 해당할까?",
        "너의 생각에 드러난 인지 왜곡을 아래 항목 중에서 골라줘!"
    ]
    
    // 합리적 반응

    static let rationalComment: [String] = [
        "아하. 그런 생각을 했구나. 그렇게 생각한 근거가 있다면 알려줄래?",
        "음. 그렇구나. 그것을 다르게 해석하는 방법은 없을까?",
        "내용을 기록하면서 기억에 남는 단어가 있니? 그것이 어떤 의미로 다가왔니?",
        "알려줘서 기뻐! 그렇다면 그 대신 생각지 못했던 다른 이유가 있는지 알아볼까?"
    ]
    
    // 결과
    static let resultComment: [String] = [
        "좋아! 오늘의 기록이 끝났어. 지금 감정은 어때?",
        "후..! 고생했어! 기록해보니 어떤 기분이 드니?",
        "음. 오늘의 일과가 무사히 끝났어. 지금은 어떤 생각이 들어?"
    ]
}
