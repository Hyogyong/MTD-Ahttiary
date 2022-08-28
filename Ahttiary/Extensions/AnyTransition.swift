//
//  AnyTransition.swift
//  아띠어리
//
//  Created by Noah's Ark on 2022/08/29.
//

import SwiftUI

extension AnyTransition {
    static func swipe(width: CGFloat) -> AnyTransition {
        return modifier(
            active: SwipeViewModifier(width: width),
            identity: SwipeViewModifier(width: 0)
        )
    }
    
    static var customOpacity: AnyTransition {
        modifier(
            active: OpacityViewModifier(level: 0.5),
            identity: OpacityViewModifier(level: 0)
        )
    }
}
