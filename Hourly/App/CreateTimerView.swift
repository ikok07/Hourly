//
//  CreateTimerView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import SwiftUI

struct CreateTimerView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @EnvironmentObject private var storageController: StorageController
    
    @State private var name: String = ""
    @State private var deadline: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 30) {
                    CustomTextFieldView(title: "Name", placeholder: "Enter timer name", text: $name)
                    
                    CustomDatePicker(deadline: $deadline)
                }
                
                Button(action: {
                    if name.count > 0 {
                        let newTimer = Timer(name: name, deadline: deadline)
                        context.insert(newTimer)
                        dismiss()
                    }
                }, label: {
                    Spacer()
                    Text("Create timer")
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .fontWeight(.bold)
                    Spacer()
                })
                .buttonStyle(.borderedProminent)
                .tint(name.count > 0 ? .cta : .secondary)
                .padding(.top, 25)
                .animation(.linear(duration: 0.1))
                
                Spacer()
            }
            .navigationTitle("Create Timer")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 30)
        }
    }
}

#Preview {
    CreateTimerView()
        .padding(.horizontal)
        .environmentObject(StorageController())
}
