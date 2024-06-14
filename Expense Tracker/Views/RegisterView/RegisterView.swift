//
//  RegisterView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 14.06.2024.
//

import SwiftUI

enum ShowHidePassword: String {
    case show = "eye"
    case hide = "eye.slash"
}

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var profileName: String = ""
    @State var password: String = ""
    
    @State var textFieldsFull = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            titleStack
            circle
                .padding(.top, 20.adjustSize())
            textFieldBlock
                .padding(.top, 20.adjustSize())
            completeButton
                .padding(.top, 30.adjustSize())
                
        }
        .padding(.top, 10.adjustSize())
        .padding(.horizontal, 16.adjustSize())
    }
}

// MARK: Components
private extension RegisterView {
    
    var title: some View {
        Text("Create your profile")
            .font(.title)
            .fontWeight(.heavy)
    }
    
    var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.backward.circle.fill")
                .font(.title)
                .foregroundColor(.cyan)
        })
    }
    
    var titleStack: some View {
        HStack {
            backButton
            Spacer()
            title
            Spacer()
        }
    }
    
    var circle: some View {
        Circle()
            .frame(width: 100.adjustSize(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.cyan)
    }
    
    var textFieldBlock: some View {
        VStack {
            TextField("Enter your profile name", text: $profileName)
                .foregroundColor(.cyan)
                .underlineTextField()
            
            SecurityTextField(password: $password, placeHolder: .password)
        }
    }
    
    var completeButton: some View {
        Button(action: {}, label: {
            Text("Create")
                .frame(maxWidth: .infinity)
                .font(.system(.title3, design: .default, weight: .medium))
                .padding(.vertical, 20.adjustSize())
                .background(textFieldsFull ? .cyan : Color.secondary)
                .foregroundColor(textFieldsFull ? .white : .secondary)
                .clipShape(RoundedRectangle(cornerRadius: 15.adjustSize(), style: .continuous))
        })
    }
}

#Preview {
    RegisterView()
}
