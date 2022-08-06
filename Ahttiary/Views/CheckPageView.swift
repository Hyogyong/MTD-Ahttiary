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
    
    var isWritingFinished: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            // 아띠와 말풍선
            HStack(alignment: .center) {
                Image("AhttyWriter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                
                Text(noteManager.questionInPresentPage)
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.Custom.ahttyWhite)
                    .cornerRadius(15)
                    .padding()
            }
            
            VStack {
                if !isWritingFinished {
                    Button("계속 쓸래") {
                        noteManager.goToNextPage()
                    }
                    .buttonStyle(.bordered)
                    Button("오늘은 여기까지만") {
                        noteManager.goToLastPage()
                    }
                    .buttonStyle(.bordered)
                } else {
                    Button("다 썼다~") {
                        noteManager.goToLastPage()
                    }
                    .buttonStyle(.bordered)
                }
            }
            
            Spacer()
        }
        .background(Color.Custom.backgroundColor.ignoresSafeArea())
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
