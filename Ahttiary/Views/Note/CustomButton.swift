//
//  CustomButton.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/16.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack (alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.Custom.carrotGreen)
                
                Text(title)
                    .font(.custom(Font.Custom.calendarBold, size: 20))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 120, maxHeight: 50)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton("테스트") {
            print("테스트")
        }
    }
}
