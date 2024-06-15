//
//  RegisterViewWrapper.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 15.06.2024.
//

import SwiftUI
import UIKit

struct RegisterViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIHostingController(rootView: RegisterView(onComplete: {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: TabBarView())
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
            }
        }))
        context.coordinator.viewController = viewController
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: RegisterViewWrapper
        weak var viewController: UIViewController?

        init(_ parent: RegisterViewWrapper) {
            self.parent = parent
        }
    }
}

