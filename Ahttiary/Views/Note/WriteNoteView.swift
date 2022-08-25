//
//  WriteNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WriteNoteView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var noteManager: NoteManager = NoteManager()
    @StateObject private var draftNote: DraftNote
    
    init(note: Note) {
        _draftNote = StateObject(wrappedValue: DraftNote(note: note))
    }
    
    var body: some View {
        
        TabView(selection: $noteManager.pageNumber) {
            // 상황
            WritePageView(noteManager: noteManager, answer: $draftNote.firstAnswer)
                .tag(0)
            
            // 정서
            WritePageView(noteManager: noteManager, answer: $draftNote.secondAnswer)
                .tag(1)
            
            // 첫 번째 감정 체크
            SelectEmotionPageView(noteManager: noteManager, answer: $draftNote.firstEmotion)
                .tag(2)
            
            // 자동적 사고 기술
            WritePageView(noteManager: noteManager, answer: $draftNote.thirdAnswer)
                .tag(3)
            
            // 인지 왜곡 파악
            SelectCognitiveDistortionPageView(noteManager: noteManager, answer: $draftNote.fourthAnswer)
                .tag(4)
            
            // 합리적 반응 도출
            WritePageView(noteManager: noteManager, answer: $draftNote.fifthAnswer)
                .tag(5)
            
            // 두 번째 감정 체크
            SelectEmotionPageView(noteManager: noteManager, answer: $draftNote.secondEmotion)
                .tag(6)
            
            // 마지막 페이지(내일도 즐거운 하루 보내자!)
            EndPageView(noteManager: noteManager)
                .tag(7)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .navigationBarTitle(draftNote.displayedDate, displayMode: .inline)
        .background(NavigationConfigurator { nc in
            nc.navigationBar.barTintColor = UIColor(Color.Custom.background)
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: customBackButton)
        .onDisappear {
            Note.updateNote(using: draftNote)
            noteManager.goToFirstPage()
        }
        
    } // End of body
}

extension WriteNoteView {
    
    // 네비게이션 바 색상을 바꾸기 위해 UIKit 기능을 불러옴.
    struct NavigationConfigurator: UIViewControllerRepresentable {
        var configure: (UINavigationController) -> Void = { _ in }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
            UIViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
            if let nc = uiViewController.navigationController {
                self.configure(nc)
            }
        }
    }
    
    // 색상 지정과 텍스트 제거를 위한 커스텀 뒤로가기 버튼
    private var customBackButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.backward") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.Custom.carrotGreen)
        }
    }
}
