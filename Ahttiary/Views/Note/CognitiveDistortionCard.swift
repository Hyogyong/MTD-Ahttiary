//
//  CognitiveDistortionCard.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import SwiftUI

struct CognitiveDistortionCard: View {
    
    @ObservedObject var distortionPageManager: DistortionPageManager
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color.Custom.background)
            .frame(width: ScreenSize.fullWidth, height: ScreenSize.fullWidth * 1.4)
            .overlay {
                VStack {
                    Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["name"]!)
                        .font(.custom(Font.Custom.comment, size: 32))
                        .padding(.top, 35)

                    Image("helloAhtty")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["description"]!)
                        .font(.custom(Font.Custom.comment, size: 24))
                        .padding()
                    
                    Text("예시) \(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["example"]!)")
                        .font(.custom(Font.Custom.comment, size: 22))
                        .padding()
                    
                    Spacer()
                    
                    ChangePageButton("확인") { withAnimation { distortionPageManager.isShowingDistortionCard.toggle() } }
                        .padding(.bottom)
                }
            }
            .scaleEffect(0.8)
        
    }// body
}// CognitiveDistortionCard
