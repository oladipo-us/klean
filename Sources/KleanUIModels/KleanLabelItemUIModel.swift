import Combine
import Foundation

public struct KleanLabelItemUIModel<Action: Hashable, Identifier: Hashable>: Hashable {
    
    public typealias ByIdentifier = [Identifier: Self]
    public typealias ByIdentifierPublisher = AnyPublisher<ByIdentifier, Never>

    public typealias IdentifierList = [Identifier]
    public typealias IdentifierListPublisher = AnyPublisher<IdentifierList, Never>
    public typealias IdentifierPublisher = AnyPublisher<Identifier, Never>

    public typealias List = [Self]
    public typealias ListPublisher = AnyPublisher<List, Never>

    public typealias Publisher = AnyPublisher<Self, Never>

    public init(
        id i: Identifier,
        action a: Action,
        labelString ls: String,
        shouldShowDisclosure ssd: Bool = false)
    {
        id = i
        action = a
        labelString = ls
        shouldShowDisclosure = ssd
    }
    
    public let id: Identifier
    
    public let labelString: String
    public let shouldShowDisclosure: Bool

    public let action: Action
}

extension KleanLabelItemUIModel {
    
    public final class Factory {
        
        public static func constructIdentifierList(
            list: List
        ) -> IdentifierList
        {
            return list.map { $0.id }
        }
        
        public static func constructByIdentifier(
            list: List
        ) -> ByIdentifier
        {
            var dict = ByIdentifier()
            
            list.forEach { dict[$0.id] = $0 }
            
            return dict
        }
    }
}
