//  ContentView.swift
//  marketplace
//
//  Created by Bravo on 25/03/2025.
//

import SwiftUI

// Main ContentView struct that serves as the entry point of the app's UI
struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    // @State is used to manage the selected tab, starting with 'Home' tab
    @State var currentTab: Tab = .Home
    
    // Custom initializer to hide the default TabBar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // Namespace for animation to allow smooth transitions between tabs
    @Namespace var animation
    
    var body: some View {
        ZStack {
            // TabView to handle different views for each tab
            TabView(selection: $currentTab) {
                // Each Tab is linked to a specific view, tagged by its respective Tab
                HomeView()
                    .tag(Tab.Home)
                SearchView()
                    .tag(Tab.Search)
                NotificationsView()
                    .tag(Tab.Notifications)
                CartView()
                    .tag(Tab.Cart)
                ProfileView()
                    .tag(Tab.Profile)
            }
            
            // Custom tab bar that appears above the TabView
            VStack {
                Spacer() // Pushes the tab bar to the bottom of the screen
                HStack(spacing: 0) {
                    // ForEach is used to loop through each tab and create a button for it
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        TabButton(tab: tab) // Custom button for each tab
                    }
                }
                .padding(.vertical) // Adds vertical padding to the tab bar
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15)) // Adjust padding for safe area
                .background(Color("kSecondary")) // Background color of the tab bar
            }
        }
        .ignoresSafeArea(.all, edges: .bottom) // Ignores the safe area at the bottom for the tab bar
    }
    
    // Custom button view for each tab
    func TabButton(tab: Tab) -> some View {
        Button(action: {
            // Animate the tab transition with a spring effect
            withAnimation(.spring()) {
                currentTab = tab
            }
        }) {
            VStack(spacing: 4) {
                // Show appropriate icon for the selected tab
                Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("kPrimary")) // Color for the icon
                
                // Show tab name with conditional opacity based on selected tab
                Text(tab.Tabname)
                    .font(.caption2)
                    .foregroundColor(Color("kPrimary"))
                    .opacity(currentTab == tab ? 1 : 0.7)
            }
            .frame(maxWidth: .infinity) // Make each button fill the available width
        }
    }
}

//implementations for each tab

// Home View
struct HomeView: View {
    var body: some View {
        HomePageView()
    }
}

// Search View
struct SearchView: View {
    var body: some View {
        Text("Search View")
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Takes full screen space
    }
}

// Notifications View
struct NotificationsView: View {
    var body: some View {
        Text("Notifications View")
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Takes full screen space
    }
}

// Cart View
struct CartView: View {
    var body: some View {
        Text("Cart View")
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Takes full screen space
    }
}

// Profile View
struct ProfileView: View {
    var body: some View {
        Text("Profile View")
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Takes full screen space
    }
}

// Previews for the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Previews ContentView
            .environmentObject(CartManager())
        
    }
}

// Enum to represent different tabs and their associated icons
enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    // A computed property to return the string name of each tab
    var Tabname: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notifications:
            return "Notifications"
        case .Cart:
            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}

// Extension to get the safe area insets of the current device
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero // Return zero in case we cannot retrieve safe area insets
        }
        return safeArea // Return the safe area insets
    }
}

// Material effect for background blur, can be used for views with blur effect
struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    // Create the UIVisualEffectView with a given blur style
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    // Update the UIVisualEffectView when the style changes
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
