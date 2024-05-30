//
//  OnboardingText.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 30.05.2024.
//

import SwiftUI

struct OnboardingText: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.system(size: 35.adjustSize(), weight: .heavy, design: .rounded))
    }
}
