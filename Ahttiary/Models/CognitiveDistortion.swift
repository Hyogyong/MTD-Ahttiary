//
//  CognitiveDistortion.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import Foundation

struct CognitiveDistortion {
    static let types: [CognitiveDistortionType] = [
        .polarizedThinking,
        .overgeneralization,
//        .catastrophizing,
        .personalization,
        .mindReading,
        .mentalFiltering,
//        .discountingThePositive,
        .shouldStatements,
        .emotionalReasoning,
        .labeling
    ]
    
    static func getDiscriptionAndExample(cognitiveDistortionType: CognitiveDistortionType) -> [String: String] {
        switch cognitiveDistortionType {
        case .polarizedThinking:
            return [
                "name": "모 아니면 도",
                "description": "모든 일을 한두 개의 범주로만 받아들이며, 중간 지대는 인정하지 않는 것.",
                "example": "완벽하지 않으면 가치가 없어"
            ]
        case .overgeneralization:
            return [
                "name": "성급한 일반화",
                "description": "사건을 확대해석하여 섣부른 결론을 내리는 것.",
                "example": "면접에서 떨어졌어. 나는 앞으로도 절대 직업을 구할 수 없을거야."
            ]
        case .personalization:
            return [
                "name": "내 탓이야",
                "description": "책임이 없거나 통제할 수 없는 사건을 자신의 탓으로 돌리는 것.",
                "example": "강아지가 갑자기 병으로 죽었어. 다 내가 그동안 잘해주지 못해서 생긴 일이야."
            ]
        case .mindReading:
            return [
                "name": "증거 없는 독심술",
                "description": "뚜렷한 근거 없이 타인의 생각이나 의도를 단정짓는 것.",
                "example": "눈이 마주쳤는데도 인사를 하지 않네. 나를 싫어하는게 분명해."
            ]
        case .mentalFiltering:
            return [
                "name": "부정 확성기",
                "description": "사건의 긍정적인 측면은 무시하고, 부정적인 측면만을 부각시켜 받아들이는 것.",
                "example": "내 실수가 이번 프로젝트를 완전히 망쳤어."
            ]
        case .shouldStatements:
            return [
                "name": "완벽주의자",
                "description": "스스로에게 비현실적인 기대를 하거나 무거운 압박을 부여하는 것.",
                "example": "하나도 긴장하지 않고 이 발표를 마쳐야만 해."
            ]
        case .emotionalReasoning:
            return [
                "name": "기분따라",
                "description": "객관적인 근거에 부합하지 않는데도, 개인적인 감정이나 느낌으로 결론을 내리는 것.",
                "example": "A는 나쁜 사람이야. 걔만 보면 질투가 나거든."
            ]
        case .labeling:
            return [
                "name": "낙인",
                "description": "자신이나 타인에게 강한 고정관념을 가지고, 그에 반하는 정보는 차단하는 것.",
                "example": "이번 대회에서 A가 활약했다고? 꼼수를 쓴게 분명해."
            ]
        }
    }
}

enum CognitiveDistortionType: String {
    case polarizedThinking
    case overgeneralization
//    case catastrophizing
    case personalization
    case mindReading
    case mentalFiltering
//    case discountingThePositive
    case shouldStatements
    case emotionalReasoning
    case labeling
}

//        case .catastrophizing:
//            return [
//                "name": "재앙화",
//                "description": "자신에게 일어난 사건을 실제보다 끔찍하고 심각하게 받아들이는 것.",
//                "example": "지난 며칠 동안 두통이 있었어. 이건 뇌종양이 틀림없어."
//            ]

//        case .discountingThePositive:
//            return [
//                "name": "긍정 격하",
//                "description": "긍정적인 경험이나 능력을 객관적으로 보지 않고 낮추어 평가하는 것.",
//                "example": "이번 시험은 우연히 잘 봤을 뿐이고, 나는 별 볼일 없는 사람이야."
//            ]
