//
//  CognitiveDistortionCell.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import SwiftUI

struct CognitiveDistortionCell: View {
    var type: CognitiveDistortionType
    @Binding var answer: String
    @ObservedObject var distortionCardManager: DistortionCardManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.white)
                .border(type.rawValue == answer ? Color.Custom.carrotGreen : Color.clear, width: 4)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .padding()
                        .onTapGesture {
                            distortionCardManager.distortionCardType = type
                            distortionCardManager.isShowingDistortionCard = true
                        }
                }
                
                Image("ahttyHello")
                    .padding()
                
                Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: type)["name"]!)
            }
            .font(.title)
        }
        .onTapGesture {
            answer = type.rawValue
        }
    }
}
