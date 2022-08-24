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
    
    var body: some View {
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
                        CognitiveDistortionCell(type: .polarizedThinking, answer: $answer)
                        
                        CognitiveDistortionCell(type: .overgeneralization, answer: $answer)
                    }
                    
                    HStack {
                        CognitiveDistortionCell(type: .catastrophizing, answer: $answer)
                        
                        CognitiveDistortionCell(type: .personalization, answer: $answer)
                    }
                    
                    HStack {
                        CognitiveDistortionCell(type: .mindReading, answer: $answer)
                        
                        CognitiveDistortionCell(type: .mentalFiltering, answer: $answer)
                    }
                    
                    HStack {
                        CognitiveDistortionCell(type: .discountingThePositive, answer: $answer)
                        
                        CognitiveDistortionCell(type: .shouldStatements, answer: $answer)
                    }
                    
                    HStack {
                        CognitiveDistortionCell(type: .emotionalReasoning, answer: $answer)
                        
                        CognitiveDistortionCell(type: .labeling, answer: $answer)
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
    }
}
