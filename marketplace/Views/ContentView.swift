import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State var currentTab: Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        ZStack {
            // TabView with explicit padding to avoid overlap
            TabView(selection: $currentTab) {
                HomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full space
                    .padding(.bottom, 60) // Reserve space for custom tab bar
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
            .environmentObject(cartManager) // Pass CartManager to all child views
            
            // Custom tab bar
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        TabButton(tab: tab)
                    }
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color("kSecondary"))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    func TabButton(tab: Tab) -> some View {
        Button(action: {
            withAnimation(.spring()) {
                currentTab = tab
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("kPrimary"))
                Text(tab.Tabname)
                    .font(.caption2)
                    .foregroundColor(Color("kPrimary"))
                    .opacity(currentTab == tab ? 1 : 0.7)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// Home View (unchanged)
struct HomeView: View {
    var body: some View {
        HomePageView()
    }
}

// Other tab views (unchanged)
struct SearchView: View {
    var body: some View {
        Text("Search View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CartView: View {
    var body: some View {
        Text("Cart View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
    }
}

enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var Tabname: String {
        switch self {
        case .Home: return "Home"
        case .Search: return "Search"
        case .Notifications: return "Notifications"
        case .Cart: return "Cart"
        case .Profile: return "Profile"
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
