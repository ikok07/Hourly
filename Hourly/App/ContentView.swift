//
//  ContentView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 11.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TimerListView()
                .tabItem {
                    Image(systemName: "list.clipboard.fill")
                    Text("List")
                }
            TimerHistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
        }
    }
}

#Preview {
    ContentView()
}
