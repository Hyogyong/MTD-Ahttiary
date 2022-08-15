//
//  AhttiaryApp.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/07/26.
//

import SwiftUI

@main
struct AhttiaryApp: App {
    
    @StateObject var persistentStore = PersistentStore.shared
    @StateObject var dateViewModel: DateViewModel = DateViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateViewModel)
                .environment(\.managedObjectContext, persistentStore.context)
        }
    }
}
