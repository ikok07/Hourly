//
//  CustomDatePicker.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var deadline: Date
    
    var body: some View {
        HStack {
            DatePicker("Test", selection: $deadline)
                .labelsHidden()
            Spacer()
        }
    }
}

#Preview {
    CustomDatePicker(deadline: .constant(Date()))
}
