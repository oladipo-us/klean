import Combine
import Foundation

public protocol KleanLogicService: ObservableObject {
    
    associatedtype Gateway
    
    init()
    
    func configure(gateway: Gateway)
}
