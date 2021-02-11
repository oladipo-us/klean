import Foundation

/*
 2021.02.11:
 - This class is meant for use with collection views
 */
public struct KleanLabelItemUIModel<Action: Hashable>: Hashable {
    
    public init(
        identifier i: String = UUID().uuidString,
        action a: Action,
        labelString ls: String)
    {
        identifier = i
        action = a
        labelString = ls
    }
    
    public let identifier: String
    
    public let action: Action
    public let labelString: String
}
