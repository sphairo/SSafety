import UIKit

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
