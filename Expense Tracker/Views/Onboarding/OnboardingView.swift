//
//  OnboardingView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 30.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            spacer
            image
            spacer
            textHorizontalStack
            subText
            spacer
            nextButton
            spacer
        }
        .padding(.horizontal, 16.adjustSize())
    }
}

extension OnboardingView {
    
    var image: some View {
        Image(ImageEnum.onboardImage.rawValue)
            .resizable()
            .frame(width: 200.adjustSize(), height: 350.adjustSize())
            .aspectRatio(contentMode: .fit)
    }
    
    var textHorizontalStack: some View {
        VStack(alignment: .center) {
            HStack {
                OnboardingText(color: .black, text: "TAKE")
                OnboardingText(color: .orange, text: "CONTROL")
            }
            HStack {
                OnboardingText(color: .black, text: "OF YOUR")
                OnboardingText(color: .cyan, text: "FINANCES")
            }
        }
        .padding(.top, 20.adjustSize())
    }
    
    var subText: some View {
        Text("Effortlessly budget, save, and spend wisely with our all-in-one app")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .font(.system(size: 18.adjustSize(), weight: .medium, design: .rounded))
            .padding(.horizontal, 20.adjustSize())
            .padding(.top, 1.adjustSize())
    }
    
    var nextButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Get Started")
                .foregroundColor(.white)
                .font(.system(size: 20.adjustSize(), weight: .heavy, design: .rounded))
                .padding(.vertical, 20.adjustSize())
                .padding(.horizontal, 40.adjustSize())
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 30.adjustSize()))
                
        })
    }
    
    var spacer: some View {
        Spacer()
    }
}

#Preview {
    OnboardingView()
}
