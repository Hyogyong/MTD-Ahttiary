//
//  Emotion.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/23.
//

import Foundation

struct EmotionStruct {
    let emotionArray: [Emotion] = [
        .angry,
        .sad,
        .irritated,
        .scared,
        .happy,
        .satisfied
    ]
    
    let emotionDictionary: [Emotion : String] = [
        .angry : "화나요",
        .sad : "슬퍼요",
        .irritated : "짜증나요",
        .scared : "두려워요",
        .happy : "행복해요",
        .satisfied : "만족해요"
    ]
}

enum Emotion: String {
    case angry
    case sad
    case irritated
    case scared
    case happy
    case satisfied
}

