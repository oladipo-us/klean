import Foundation

import KleanFoundation

public protocol KleanLogic: ObservableObject {
    
    associatedtype Service
    
    init()
    
    func configure(service: Service) -> Set<KleanCancellable>
}
