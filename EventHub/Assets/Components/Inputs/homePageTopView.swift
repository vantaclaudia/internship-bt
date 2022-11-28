//
//  homePageTopView.swift
//  EventHub
//
//  Created by Claudia Vanta on 26.11.2022.
//

import SwiftUI
import Foundation

struct homePageTopView: View {
    let releaseDate = Date()
    
    static let stackDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = .current
            formatter.dateFormat = "EEEE, d MMM"
            
            return formatter
        }()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                HStack {
                    Text("\(releaseDate, formatter: Self.stackDateFormat)").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12)).textCase(.uppercase)
                    Image("cloud")
                    Text("16°C").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                }.padding(.top, -20)
                HStack{
                    Text("Oradea, România").fontWeight(.bold).foregroundColor(.white).font(.system(size: 24))
                    HStack{
                        Image("gps").foregroundColor(.black).padding(-10)
                        Text("Schimbă").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    }.padding(.leading, 90).padding(.bottom, 20)
                }
                HStack {
                    Text("").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    Image("")
                    Text("").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                }
                HStack{
                    SearchSettingsComponent()
                }.padding(.top, -10)
                HStack{
                    //colored buttons
                }.padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("darkPurple")]), startPoint: .top, endPoint: .bottom).cornerRadius(33).ignoresSafeArea(edges: .top)
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
