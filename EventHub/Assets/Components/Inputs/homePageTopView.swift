//
//  homePageTopView.swift
//  EventHub
//
//  Created by Claudia Vanta on 26.11.2022.
//

import SwiftUI

struct homePageTopView: View {

    var body: some View {
        VStack {
            VStack(alignment: .leading){
                HStack {
                    Text("VINERI, 28 OCT").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    Image("cloud")
                    Text("16°C").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                }
                HStack{
                    Text("Oradea, România").fontWeight(.bold).foregroundColor(.white).font(.system(size: 24))
                    HStack{
                        Image("gps").foregroundColor(.black).padding(-10)
                        Text("Schimbă").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    }.padding(.leading, 90).padding(.bottom, 20)
                }
                HStack {
                    Text("VINERI, 28 OCT").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    Image("cloud")
                    Text("16°C").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                }
                HStack{
                    Text("Oradea, România").fontWeight(.bold).foregroundColor(.white).font(.system(size: 24))
                    HStack{
                        Image("gps").foregroundColor(.black).padding(-10)
                        Text("Schimbă").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    }.padding(.leading, 90).padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("darkPurple")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(edges: .top)
            )
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

struct homePageTopView_Previews: PreviewProvider {
    static var previews: some View {
//        VStack{
            homePageTopView()
//            Spacer()
//        }
    }
}
