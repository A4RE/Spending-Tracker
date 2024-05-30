//
//  HomeView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 30.05.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            spacer
            totalBalanceText
        }
    }
}

extension HomeView {
    
    var spacer: some View {
        Spacer()
    }
    
    var totalBalanceText: some View {
        Text("Total Balance")
            .font(.system(size: 20.adjustSize(), weight: .semibold, design: .rounded))
            .foregroundColor(.secondary)
    }
}

#Preview {
    HomeView()
}
