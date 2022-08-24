//
//  CognitiveDistortion.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import Foundation

struct CognitiveDistortion {
    static func getDiscriptionAndExample(cognitiveDistortionType: CognitiveDistortionType) -> [String: String] {
        switch cognitiveDistortionType {
        case .polarizedThinking:
            return [
                "name": "흑백논리",
                "description": "극단적으로 생각하는 경향",
                "example": ""
            ]
        case .overgeneralization:
            return [
                "name": "지나친 보편화",
                "description": "하나의 사건을 항구적인 패배의 이유로 본다.",
                "example": ""
            ]
        case .catastrophizing:
            return [
                "name": "파국화",
                "description": "하나의 사건을 항구적인 패배의 이유로 본다.",
                "example": ""
            ]
        case .personalization:
            return [
                "name": "개인화",
                "description": "하나의 사건을 항구적인 패배의 이유로 본다.",
                "example": ""
            ]
        case .mindReading:
            return [
                "name": "지나친 보편화",
                "description": "하나의 사건을 항구적인 패배의 이유로 본다.",
                "example": ""
            ]
        case .mentalFiltering:
            return [
                "name": "필터링",
                "description": "부정적인 사건만 부각시켜 받아들인다.",
                "example": ""
            ]
        case .discountingThePositive:
            return [
                "name": "긍정 격하",
                "description": "긍정적인 결과에도 불구하고 이를 의도적으로 부인한다.",
                "example": ""
            ]
        case .shouldStatements:
            return [
                "name": "당위 진술",
                "description": "\"해야 한다\" 혹은 \"해서는 안 된다\" 등 극단적인 동기를 유발한다. 어떠한 행동을 하기도 전에 자신에게 부담을 주며, 이를 타인에게 적용함으로써 더 큰 좌절을 느낀다.",
                "example": ""
            ]
        case .emotionalReasoning:
            return [
                "name": "감정적 추리",
                "description": "하나의 사건을 항구적인 패배의 이유로 본다.",
                "example": ""
            ]
        case .labeling:
            return [
                "name": "낙인",
                "description": "하나의 사건을 항구적인 패배의 이유로 본다.",
                "example": ""
            ]
        }
    }
}

enum CognitiveDistortionType: String {
    case polarizedThinking
    case overgeneralization
    case catastrophizing
    case personalization
    case mindReading
    case mentalFiltering
    case discountingThePositive
    case shouldStatements
    case emotionalReasoning
    case labeling
}
