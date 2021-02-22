import Combine
import Foundation

public typealias KleanCancellable = AnyCancellable

extension KleanCancellable {
        
    public final class Factory {
        
        public static func constructSet(
            cancellableList: [KleanCancellable]
        ) -> Set<KleanCancellable>
        {
            var cancellableSet = Set<KleanCancellable>()
            
            cancellableList.forEach { cancellableSet.insert($0) }
            
            return cancellableSet
        }
    }
}
