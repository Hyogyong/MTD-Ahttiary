//
//  DistortionCardManager.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import Foundation

final class DistortionCardManager: ObservableObject {
    
    @Published var isShowingDistortionCard: Bool = false
    @Published var distortionCardType: CognitiveDistortionType = .polarizedThinking
}
