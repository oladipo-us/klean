import UIKit

import KleanFoundation

open class KleanUI: UIView {
    
    required public init(translatesAutoresizingMaskIntoConstraints tamic: Bool = true) {
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = tamic
    }
    
    required public init?(coder: NSCoder) {
        fatal_klean_notImplemented("init(coder:)")
    }
}
