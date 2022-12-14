//
//  ParticipatePurpleButton.swift
//  EventHub
//
//  Created by Claudia Vanta on 08.12.2022.
//

import SwiftUI

struct ParticipatePurpleButton: View {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        HStack{
            Button(action: {
                action()
            }) {
                Text("VREAU SĂ PARTICIP").fontWeight(.bold).foregroundColor(.white).font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .center).padding(.leading, 80)
                Image("star")
                    .padding(.trailing, 50)
            }
        }.background(Color("purple").cornerRadius(16).frame(width: 366, height: 64)).padding(.top, 20)
    }
}

struct ParticipatePurpleButton_Previews: PreviewProvider {
    static var previews: some View {
        ParticipatePurpleButton() { }
    }
}
