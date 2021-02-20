import Combine
import Foundation

public final class KleanCancellableHelper {
    
    public static func constructSet(_ anyCancellablesList: [AnyCancellable]) -> Set<AnyCancellable>
    {
        var cancellables = Set<AnyCancellable>()
        
        anyCancellablesList.forEach { cancellables.insert($0) }
        
        return cancellables
    }
}
