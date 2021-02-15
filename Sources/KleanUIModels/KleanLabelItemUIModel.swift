import Foundation

public struct KleanLabelItemUIModel<Action: Hashable, Identifier: Hashable>: Hashable {
    
    public init(
        id i: Identifier,
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
