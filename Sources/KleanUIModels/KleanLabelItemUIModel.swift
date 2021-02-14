import Foundation

public struct KleanLabelItemUIModel<Action: Hashable, Identifier: Identifiable & Hashable>: Hashable {
    
    public init(
        identifier i: Identifier,
        action a: Action,
        labelString ls: String)
    {
        identifier = i
        action = a
        labelString = ls
    }
    
    public let identifier: Identifier
    
    public let action: Action
    public let labelString: String
}
