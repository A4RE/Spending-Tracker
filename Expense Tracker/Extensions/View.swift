//
//  View.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 14.06.2024.
//

import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.orange)
            .padding(10)
    }
}
