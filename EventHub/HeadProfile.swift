//
//  HeadProfile.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct HeadProfile: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
//                        action()
                    }) {
                        Image("add").padding(.trailing, 120)
                    }
                    Button(action: {
//                        action()
                    }) {
                        Image("edit").padding(.leading, 120)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                VStack{
                    Image("profile-image")
                    Text("Scarlett Johansson")
                        .font(.system(size: 24)).bold().padding(.top)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.top, 70)
        .padding(.bottom)
    }
}

struct HeadProfile_Previews: PreviewProvider {
    static var previews: some View {
        HeadProfile()
    }
}
