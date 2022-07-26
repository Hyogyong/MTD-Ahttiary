//
//  ContentView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("ahtty")
                .resizable()
                .frame(width: 300, height: 300)
                
            Text("하루의 끝 당신의 곁엔 아띠가 있어요.")
                .padding()
        }
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
