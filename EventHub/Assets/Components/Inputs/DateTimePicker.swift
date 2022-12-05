//
//  GenericInput.swift
//  EventHub
//
//  Created by Claudia Vanta on 25.11.2022.
//

import SwiftUI

struct DateTimePicker: View {
    @State private var datePicker = Date()
    var placeholder: String
    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let minDate = calendar.date(byAdding: .year, value: 0, to: .now)
        let maxDate = calendar.date(byAdding: .year, value: 0, to: .distantFuture)
        
        return minDate!...maxDate!
    }()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        HStack {
            Text(placeholder)
                .foregroundColor(Color.gray).font(.system(size: 15))
            DatePicker(selection: $datePicker, in: dateRange, displayedComponents: .date) {
                Text("date")
            }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 10)
        }
        .labelsHidden()
        .padding(.leading)
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(Color("borderGrey")))
        .background(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 0))
        .cornerRadius(16)
    }
}

struct DateTimePicker_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePicker(placeholder: "")
    }
}

