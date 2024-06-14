//
//  SecurityTextField.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 14.06.2024.
//

import SwiftUI

struct SecurityTextField: View {
    
    enum SecurityTextPlaceHolder: String {
        case password = "Create a password"
        case confirmPassword = "Confirm password"
    }
    
    @Binding var password: String
    var placeHolder: SecurityTextPlaceHolder
    @State private var isShow: Bool = false
    
    var body: some View {
        HStack {
            if isShow {
                TextField(placeHolder.rawValue, text: $password)
                    .foregroundColor(.cyan)
                    .autocorrectionDisabled()
            } else {
                SecureField(placeHolder.rawValue, text: $password)
                    .foregroundColor(.cyan)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: isShow ? ShowHidePassword.hide.rawValue : ShowHidePassword.show.rawValue)
                                    .foregroundColor(.cyan)
            }

        }
        .underlineTextField()
    }
}


#Preview {
    SecurityTextField(password: .constant("111111"), placeHolder: .password)
}
