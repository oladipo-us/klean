import Combine
import Foundation

public typealias KleanString = String

extension KleanString {
    
    public typealias List = [Self]
    public typealias ListPublisher = AnyPublisher<List, Never>
    
    public typealias Publisher = AnyPublisher<Self, Never>
}
