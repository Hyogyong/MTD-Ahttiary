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
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.Custom.background)
            
            VStack {
                Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["name"]!)
                
                Image("ahttyHello")
                    .padding()
                
                Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["description"]!)
                
                Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["example"]!)
                
                CustomButton("확인") {
                    distortionPageManager.isShowingDistortionCard = false
                }
            }
            .font(.title)
        }
    }
}
