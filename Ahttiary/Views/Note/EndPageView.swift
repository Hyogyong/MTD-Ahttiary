//
//  EndingNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/06.
//

import SwiftUI

struct EndPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    
    @Environment(\.dismiss) private var dismiss
    
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
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
            }
            
            Button("종료하기") {
                dismiss()
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .background(Color.Custom.background.ignoresSafeArea())
    }
}
