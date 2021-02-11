import Combine
import Foundation

public protocol KleanUIPresenter: ObservableObject {
    
    associatedtype Logic
    
    init()
    
    func configure(logic: Logic) -> Set<AnyCancellable>
}
