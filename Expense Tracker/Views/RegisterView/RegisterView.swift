//
//  RegisterView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 14.06.2024.
//

import SwiftUI
import PhotosUI

enum ShowHidePassword: String {
    case show = "eye"
    case hide = "eye.slash"
}

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject private var regViewModel = RegisterViewModel()
    @State private var selectedImage: UIImage? = nil
    @State private var isPickerPresented: Bool = false
    
    private(set) var onComplete: () -> Void
    
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
        .alert(isPresented: $regViewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Passwords isn't equal"),
                dismissButton: .default(Text("OK"))
            )
        }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(selectedImage: $selectedImage)
        }
        .onChange(of: regViewModel.shouldNavigateToTabBar, { _, newValue in
            if newValue {
                onComplete()
            }
        })
        .onTapGesture {
            hideKeyboard()
        }
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
        ZStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100.adjustSize(), height: 100.adjustSize())
                    .clipShape(Circle())
            } else {
                Circle()
                    .frame(width: 100.adjustSize(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.cyan)
            }
        }
        .onTapGesture {
            isPickerPresented = true
        }
    }
    
    var textFieldBlock: some View {
        VStack {
            TextField("Enter your profile name", text: $regViewModel.profileName)
                .foregroundColor(.cyan)
                .underlineTextField()
            
            SecurityTextField(password: $regViewModel.password, placeHolder: .password)
            
            SecurityTextField(password: $regViewModel.confirmPassword, placeHolder: .confirmPassword)
        }
    }
    
    var completeButton: some View {
        Button(action: {
            regViewModel.checkPasswords()
        }, label: {
            Text("Create profile")
                .frame(maxWidth: .infinity)
                .font(.system(.title3, design: .default, weight: .medium))
                .padding(.vertical, 20.adjustSize())
                .background(regViewModel.textFieldsAreFull ? .cyan : Color.secondary)
                .foregroundColor(regViewModel.textFieldsAreFull ? .white : .secondary)
                .clipShape(RoundedRectangle(cornerRadius: 15.adjustSize(), style: .continuous))
        })
    }
}

// MARK: Functions
private extension RegisterView {
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//#Preview {
//    RegisterView()
//}
