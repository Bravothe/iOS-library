import SwiftUI
import PassKit

// The main view that wraps the PKPaymentButton and handles the action.
struct PaymentButton: View {
    // The action that will be triggered when the button is tapped
    var action: () -> Void
    
    // The body of the PaymentButton is just the Representable view.
    var body: some View {
        Representable(action: action) // Using the Representable to create the actual PKPaymentButton.
    }
}

struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        // A simple preview for the PaymentButton where the action just prints a message to the console.
        PaymentButton(action: {
            print("Payment button pressed")
        })
        .frame(height: 45) // Set the height for the button in the preview.
        .padding() // Add padding around the button for better layout.
    }
}

// MARK: - Representable
// This struct is responsible for bridging the UIKit-based PKPaymentButton to SwiftUI.
extension PaymentButton {
    struct Representable: UIViewRepresentable {
        // The action that should be executed when the button is tapped.
        var action: () -> Void
        
        // This function creates a coordinator that will handle the action logic.
        func makeCoordinator() -> Coordinator {
            // The coordinator's purpose is to manage the interaction between the UIKit button (PKPaymentButton) and the SwiftUI view.
            Coordinator(action: action)
        }
        
        // This function creates the actual PKPaymentButton that will be displayed.
        func makeUIView(context: Context) -> some UIView {
            // Returning the actual PKPaymentButton from the coordinator. It's what the user will see.
            context.coordinator.button
        }
        
        // This function updates the view with any changes in the action closure.
        // It's called whenever the SwiftUI view's state changes, so it ensures that the button's action is always up-to-date.
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action // Updating the action for the button.
        }
    }
}

// MARK: - Coordinator
// The Coordinator class acts as a bridge between SwiftUI and UIKit components.
// It manages the `PKPaymentButton` and its action.
extension PaymentButton.Representable {
    class Coordinator: NSObject {
        // The action that will be triggered when the button is tapped
        var action: () -> Void
        // The actual PKPaymentButton UI element
        var button = PKPaymentButton(paymentButtonType: .continue, paymentButtonStyle: .automatic)
        
        // The initializer takes the action closure and sets it up for the button.
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            
            // Adding the target-action mechanism for the button.
            // When the button is tapped, it calls the `callBack` method.
            button.addTarget(self, action: #selector(callBack(_:)), for: .touchUpInside)
        }
        
        // This is the callback method that's triggered when the button is pressed.
        // It invokes the action closure that was passed into the `Coordinator` during initialization.
        @objc func callBack(_ sender: Any) {
            action() // Trigger the action closure
        }
    }
}
