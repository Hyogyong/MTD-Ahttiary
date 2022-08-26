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
        RoundedRectangle(cornerRadius: 15)
            .stroke(type.rawValue == answer ? Color.Custom.carrotGreen : Color.clear, lineWidth: 6)
            .frame(maxWidth: .infinity, minHeight: 250, maxHeight: .infinity)
            .background(Color.Custom.carrot)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                distortionPageManager.distortionCardType = type
                                distortionPageManager.isShowingDistortionCard.toggle()
                            }
                        } label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(.gray)
                                .font(.title2)
                        }
                    }
                    .padding(.trailing)
                    .padding(.top)
                    
                    Image("helloAhtty")
                        .resizable()
                    
                    Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: type)["name"]!)
                        .font(.custom(Font.Custom.calendarLight, size: 20))
                        .padding(.vertical)
                }
            }
            .scaleEffect(0.85)
            .onTapGesture { withAnimation { answer = type.rawValue } }
        
    }// body
}// CognitiveDistortionCell
