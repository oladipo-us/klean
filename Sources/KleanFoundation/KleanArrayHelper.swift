import Foundation

public final class KleanArrayHelper {
    
    public static func join<Type>(list1: Array<Type>, list2: Array<Type>) -> Array<Type>
    {
        var union = list1
        union.append(contentsOf: list2)
        return union
    }
}
