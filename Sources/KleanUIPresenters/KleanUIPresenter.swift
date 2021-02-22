import Foundation

import KleanFoundation

public protocol KleanUIPresenter: ObservableObject {
    
    associatedtype Logic
    
    init()
    
    func configure(logic: Logic) -> Set<KleanCancellable>
}
