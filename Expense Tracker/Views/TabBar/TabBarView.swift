//
//  TabBarView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 15.06.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("1")
                .tabItem {
                    Label("1", systemImage: "xmark")
                }
            Text("2")
                .tabItem {
                    Label("2", systemImage: "xmark")
                }
            Text("3")
                .tabItem {
                    Label("3", systemImage: "xmark")
                }
        }
    }
}

#Preview {
    TabBarView()
}
