//
//  OnboardingTabView.swift
//  아띠어리
//
//  Created by 이효경 on 2022/10/06.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        TabView {
            // 페이지 1: 앱 소개
            OnboardingPageView(
                imageName: "normalAhtty",
                title: "안녕",
                subtitle: "질문을 던지고, 다른 사람의 답변을 확인하세요"
            )
            
            // 페이지 2: 쓰기 페이지 안내
            OnboardingPageView(
                imageName: "noteAhtty",
                title: "잘가",
                subtitle: "이 앱은 개인 메모장으로도 쓸 수 있어요"
            )
            
//            // 페이지 3: 읽기 페이지 안내 + 온보딩 완료
//            OnboardingLastPageView(
//                imageName: "eyes",
//                title: "읽기 탭",
//                subtitle: "시행착오를 정리해서 공유하고, 다른 개발자들의 인사이트를 얻으세요",
//                isFirstLaunching: $isFirstLaunching
//            )
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
