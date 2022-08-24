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
                Image("ahttyHello")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                
                Text(noteManager.questionInPresentPage)
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.Custom.background)
                    .font(.custom(Font.comment, size: 20))
                    .padding()
            }
            
            CustomButton("종료하기") {
                dismiss()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Custom.background.ignoresSafeArea())
    }
}
