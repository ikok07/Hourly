//
//  CustomTextFieldView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            TextField(placeholder, text: $text)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.secondary, lineWidth: 0.5)
                }
        }
    }
}

#Preview {
    CustomTextFieldView(title: "Name", placeholder: "Enter timer name", text: .constant(""))
        .padding(.horizontal)
}
