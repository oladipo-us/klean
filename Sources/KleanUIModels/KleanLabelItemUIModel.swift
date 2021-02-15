import Foundation

public struct KleanLabelItemUIModel<Action: Hashable, Context: Hashable>: Hashable {
    
    public init(
        action a: Action,
        context c: Context,
        labelString ls: String)
    {
        action = a
        context = c
        labelString = ls
    }
    
    public let action: Action
    public let context: Context
    public let labelString: String
}
