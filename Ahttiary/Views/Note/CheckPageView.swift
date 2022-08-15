//
//  CheckNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/06.
//

import SwiftUI

struct CheckPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @FocusState var isTextFieldsFocused: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            // 아띠와 말풍선
            HStack(alignment: .center) {
                Image("ahttyHello")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                
                Text(noteManager.questionInPresentPage)
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
            }
            
            HStack(spacing: 20) {
                CustomButton("이전") {
                    noteManager.goToPreviousPage()
                }
                
                CustomButton("선택 완료") {
                    noteManager.goToNextPage()
                }
            }
            
            Spacer()
        }
        .background(Color.Custom.background.ignoresSafeArea())
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button {
                    isTextFieldsFocused = false
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
                
            }
        }
    }
}
