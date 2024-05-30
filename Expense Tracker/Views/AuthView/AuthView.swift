//
//  AuthView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 29.05.2024.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack (alignment: .center) {
            Text("Выберете профиль")
                .font(.headline)
                .fontWeight(.heavy)
            HStack {
                Text("Еще нет профиля? ")
                Button("Создать") {
                    print("make")
                }
            }
        }
    }
}

#Preview {
    AuthView()
}
