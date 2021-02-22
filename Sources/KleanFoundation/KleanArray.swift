import Foundation

public typealias KleanArray = Array

public extension KleanArray {
    
    static func join(
        list1: Self,
        list2: Self
    ) -> Self
    {
        var union = list1
        union.append(contentsOf: list2)
        
        return union
    }
}
