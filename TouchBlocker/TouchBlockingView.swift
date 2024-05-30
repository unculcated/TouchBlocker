import UIKit

class TouchBlockingView: UIView {

    var passThroughView: UIView?

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        // If the touch is inside the pass-through view, return false to let the touch pass through
        if let passThroughView = passThroughView, passThroughView.point(inside: convert(point, to: passThroughView), with: event) {
            return false
        }
        // Otherwise, capture all touch events
        return true
    }
}
