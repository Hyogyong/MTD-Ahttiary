//
//  Text.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import SwiftUI

extension Text {
    // Text의 가로 간격을 최대화 합니다.
    func expandHorizontally() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
    
}// Text
