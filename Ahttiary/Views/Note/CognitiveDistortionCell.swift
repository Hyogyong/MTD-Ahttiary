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
    @ObservedObject var distortionPageManager: DistortionPageManager
    
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
                            distortionPageManager.distortionCardType = type
                            distortionPageManager.isShowingDistortionCard = true
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
