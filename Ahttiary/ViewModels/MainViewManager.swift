//
//  MainViewManager.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/18.
//

import Foundation
import SwiftUI

final class MainViewManager: ObservableObject {
    @Published var pageNumber: Int = 0
    @Published var note: FetchedResults<Note>.Element? = nil
    
    func goToMainView() {
        withAnimation {
            pageNumber = 0
        }
    }

    func goToWritingView() {
        withAnimation {
            pageNumber = 1
        }
    }
    
    func goToReadingView() {
        withAnimation {
            pageNumber = 2
        }
    }
        
    func updateNote(_ data: FetchedResults<Note>.Element) { self.note = data }
    
}// MainViewManager
