import UIKit

class ViewController: UIViewController {

    var overlayView: TouchBlockingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the window's background color to clear
        if let window = UIApplication.shared.windows.first {
            window.backgroundColor = UIColor.clear
        }
        
        // Set the view controller's background color to clear
        view.backgroundColor = UIColor.clear
        
        // Create the switch and add it to the view
        let toggleSwitch = UISwitch()
        toggleSwitch.addTarget(self, action: #selector(toggleScreenLock), for: .valueChanged)
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(toggleSwitch)
        
        // Position the switch at the bottom left of the screen
        NSLayoutConstraint.activate([
            toggleSwitch.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            toggleSwitch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    @objc func toggleScreenLock(_ sender: UISwitch) {
        if sender.isOn {
            if overlayView == nil {
                let overlay = TouchBlockingView(frame: view.bounds)
                overlay.backgroundColor = UIColor.clear // Make the overlay completely transparent
                overlay.passThroughView = sender // Allow touches to pass through to the switch
                view.addSubview(overlay)
                overlayView = overlay
            }
        } else {
            overlayView?.removeFromSuperview()
            overlayView = nil
        }
    }
}
