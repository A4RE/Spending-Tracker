//
//  HomeView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 30.05.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack {
                titleStack
                spendingText
                    .padding(.top, 20.adjustSize())
                spendingNumText
                    .padding(.top, 10.adjustSize())
                // TODO: Добавить график с тратами по дням
                spacer
            }
            .padding(.horizontal, 16.adjustSize())
        }
    }
}

extension HomeView {
    
    var spacer: some View {
        Spacer()
    }
    
    var titleStack: some View {
        HStack {
            Spacer()
            dateLabel
            Spacer()
            createTopButton(icon: "gear") {
                // TODO: Показ меню с выбором валюты
                print("Settings")
            }
        }
    }
    
    private func createTopButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 22.adjustSize())
        })
        .foregroundStyle(.black)
    }
    
    var dateLabel: some View {
        VStack {
            Text("Today is")
                .font(.subheadline)
            Text("\(Date.now.formatted(Date.FormatStyle().weekday())), \(Date.now, format: .dateTime.day(.defaultDigits).month())")
                .font(.headline)
        }
    }
    
    var spendingText: some View {
        Text("Total Spendings")
            .font(.system(size: 20.adjustSize(), weight: .semibold, design: .rounded))
            .foregroundColor(.secondary)
    }
    
    var spendingNumText: some View {
        Text("3000.50 ₽")
            .font(.system(size: 50.adjustSize(), weight: .bold, design: .rounded))
            .foregroundStyle(.primary)
    }
}

#Preview {
    HomeView()
}
