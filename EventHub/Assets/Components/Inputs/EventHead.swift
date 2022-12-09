//
//  EventHead.swift
//  EventHub
//
//  Created by Claudia Vanta on 07.12.2022.
//

import SwiftUI

struct EventHead: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        HStack {
            HStack {
                Button(action: action) {
                    Image("close")
                        .renderingMode(.template)
                        .foregroundColor(Color.black)
                        .padding()
                }
                .frame(width: 40, height: 40)
                .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 0).background(Color("fadedBlack")))
                .cornerRadius(20)
                .padding(.leading, -90)
            }
//            .padding(.top, 50)
            HStack{
                Text("Evenimentul tău")
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
            }
        }
    }
}

struct EventHead_Previews: PreviewProvider {
    static var previews: some View {
        EventHead() { }
    }
}
