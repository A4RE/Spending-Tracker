//
//  TabBarView.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 15.06.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var currentTab: Tab = .home
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTab) {
                HomeView()
                    .tag(Tab.home)
                Text("Transactions")
                    .tag(Tab.transactions)
                Text("Profile")
                    .tag(Tab.profile)
            }
            .toolbar(.hidden, for: .tabBar)
            
            VStack {
                Spacer()
                tabBar
            }
        }
    }
}

private extension TabBarView {
    var tabBar: some View {
        HStack {
            Spacer()
            tabBarButton(tab: .home, image: "house")
            Spacer()
            tabBarButton(tab: .transactions, image: "list.clipboard.fill")
            Spacer()
            tabBarButton(tab: .profile, image: "person.circle.fill")
            Spacer()
        }
        .padding()
        .frame(height: 70.adjustSize())
        .background {
            RoundedRectangle(cornerRadius: 36)
                .fill(RadialGradient(gradient: Gradient(colors: [.gray, .white]), center: .center, startRadius: 2, endRadius: 300.adjustSize()))
                .shadow(color: Color.black.opacity(0.5), radius: 8.adjustSize(), y: 2.adjustSize())
        }
        .padding(.horizontal, 50.adjustSize())
    }
    
    func tabBarButton(tab: Tab, image: String) -> some View {
        Button(action: {
            withAnimation {
                currentTab = tab
            }
        }, label: {
            VStack(alignment: .center) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: currentTab == tab ? 30.adjustSize() : 18.adjustSize())
            }
        })
        .foregroundStyle(currentTab == tab ? .black : Color(uiColor: .darkGray))
    }
}

enum Tab {
    case home
    case transactions
    case profile
}


#Preview {
    TabBarView()
}
