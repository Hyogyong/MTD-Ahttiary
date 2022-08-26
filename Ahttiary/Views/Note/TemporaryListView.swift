//
//  TemporaryListView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import SwiftUI

struct TemporaryListView: View {
    
    @FetchRequest(fetchRequest: Note.allNotesFR())
    private var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationView {
            List {
                Section("총 \(notes.count)개") {
                    ForEach(notes) { note in
                        NavigationLink {
                            WriteNoteView(note: note)
                        } label: {
                            Text(note.dateCreated.convertToDisplayedDate())
                        }
                    }
                }
            }
            .navigationTitle("임시 리스트")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: drawAddNoteButton)
            }
        }
    }
    
    func drawAddNoteButton() -> some View {
        Button {
            withAnimation {
                Note.addNote()
            }
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct TemporaryListView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryListView()
    }
}
