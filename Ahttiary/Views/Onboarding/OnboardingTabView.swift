//
//  OnboardingTabView.swift
//  아띠어리
//
//  Created by 이효경 on 2022/10/06.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    
    init(isFirstLaunching: Binding<Bool>) {
        _isFirstLaunching = isFirstLaunching
        
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.Custom.carrotGreen)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        VStack {
            TabView {
                // 페이지 1
                OnboardingPageView(
                    imageName: "Onboarding_1",
                    title: "나의 하루, 나의 감정을\n아띠와 함께 기록해요"
                )
                
                // 페이지 2
                OnboardingPageView(
                    imageName: "Onboarding_2",
                    title: "나의 감정을 알아가며\n행복해지는 방법을 배워요"
                )
                
                // 페이지 3
                OnboardingPageView(
                    imageName: "Onboarding_3",
                    title: "나를 더 잘 아는 것,\n스스로의 행복을 찾는 첫 걸음입니다"
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
            
            Button {
                
            } label: {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Custom.carrotGreen)
                    
                    Text("buttonText")
                        .font(.custom(Font.Custom.calendarBold, size: 20))
                        .foregroundColor(.white)
                }
                .frame(minWidth: 250, maxHeight: 50)
            }
            .padding(.horizontal, 70)
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}
