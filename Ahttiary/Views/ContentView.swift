//
//  ContentView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mainViewManager: MainViewManager
    @FetchRequest(fetchRequest: Note.allNotesFR())
    private var notes: FetchedResults<Note>
    
    var body: some View {
        switch (mainViewManager.pageNumber) {
        case 0:
            MainView()
        case 1:
            TemporaryListView()
        case 2:
            WriteNoteView(note: mainViewManager.note!)
        default:
            MainView()
        }
        
    }// body    
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
