//
//  AddEvent.swift
//  EventHub
//
//  Created by Claudia Vanta on 01.12.2022.
//

import SwiftUI

struct AddEvent: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Nu ai găsit ceva pe" + "\n" + "placul tău?").fontWeight(.bold).foregroundColor(.white).font(.system(size: 16)).padding(.top, -20)
                Button(action: {
                    //direct to add event page
                }) {
                    Image("addEvent").foregroundColor(.black).padding(.top, 10)
                }
                .padding(.leading, 100)
            }
            HStack{
                Text("Organizează un eveniment!").foregroundColor(Color.white).font(.system(size: 14)).padding(.top, -30)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("darkPurple")]), startPoint: .top, endPoint: .bottom).cornerRadius(16).ignoresSafeArea(edges: .top).frame(width: 366, height: 108)
        )
        .frame(maxWidth: .infinity)
    }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent()
    }
}
