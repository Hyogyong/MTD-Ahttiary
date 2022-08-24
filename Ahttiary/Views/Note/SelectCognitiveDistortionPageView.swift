//
//  SelectCognitiveDistortionPageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import SwiftUI

struct SelectCognitiveDistortionPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @Binding var answer: String
    
    @ObservedObject var distortionCardManager: DistortionCardManager = DistortionCardManager()
    
    var body: some View {
        ZStack {
            VStack {
                // 아띠와 말풍선
                HStack(alignment: .center) {
                    Image("ahttyHello")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ScreenSize.ahttyWriterWidth)
                    
                    Text(noteManager.randomComments[noteManager.pageNumber])
                        .frame(
                            height: ScreenSize.questionMessageBoxHeight,
                            alignment: .center
                        )
                        .background(Color.Custom.background)
                        .font(.custom(Font.shared.comment, size: 20))
                        .padding()
                }
                
                // Emotion Selecting Buttons
                ScrollView {
                    VStack {
                        HStack {
                            CognitiveDistortionCell(type: .polarizedThinking, answer: $answer, distortionCardManager: distortionCardManager)
                            
                            CognitiveDistortionCell(type: .overgeneralization, answer: $answer, distortionCardManager: distortionCardManager)
                        }
                        
                        HStack {
                            CognitiveDistortionCell(type: .catastrophizing, answer: $answer, distortionCardManager: distortionCardManager)
                            
                            CognitiveDistortionCell(type: .personalization, answer: $answer, distortionCardManager: distortionCardManager)
                        }
                        
                        HStack {
                            CognitiveDistortionCell(type: .mindReading, answer: $answer, distortionCardManager: distortionCardManager)
                            
                            CognitiveDistortionCell(type: .mentalFiltering, answer: $answer, distortionCardManager: distortionCardManager)
                        }
                        
                        HStack {
                            CognitiveDistortionCell(type: .discountingThePositive, answer: $answer, distortionCardManager: distortionCardManager)
                            
                            CognitiveDistortionCell(type: .shouldStatements, answer: $answer, distortionCardManager: distortionCardManager)
                        }
                        
                        HStack {
                            CognitiveDistortionCell(type: .emotionalReasoning, answer: $answer, distortionCardManager: distortionCardManager)
                            
                            CognitiveDistortionCell(type: .labeling, answer: $answer, distortionCardManager: distortionCardManager)
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    CustomButton("이전") {
                        noteManager.goToPreviousPage()
                    }
                    
                    CustomButton("선택 완료") {
                        noteManager.goToNextPage()
                    }
                    .disabled(answer.isEmpty)
                    .opacity(answer.isEmpty ? 0.7 : 1)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Custom.background.ignoresSafeArea())
            
            if distortionCardManager.isShowingDistortionCard {
                Color.black.opacity(0.2)
                CognitiveDistortionCard(distortionCardManager: distortionCardManager)
                    .frame(width: ScreenSize.distortionCardWidth, height: ScreenSize.distortionCardHeight, alignment: .center)
            }
        }
    }
}
