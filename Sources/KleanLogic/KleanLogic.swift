import Combine
import Foundation

public protocol KleanLogic: ObservableObject {
    
    associatedtype Service
    
    init()
    
    func configure(service: Service) -> Set<AnyCancellable>
}
