import Combine
import Foundation

public typealias KleanDate = Date

extension KleanDate {
    
    // MARK: - Public
    
    public typealias List = [Self]
    public typealias ListPublisher = AnyPublisher<List, Never>
    
    public typealias Publisher = AnyPublisher<Self, Never>
    
    public static func mostRecent(
        dateList: List
    ) -> KleanDate?
    {
        return dateList.reduce(nil, get_MostRecent_Reducer())
    }
    
    // MARK: - Private - Reducers
    
    private static func get_MostRecent_Reducer(
    ) -> (KleanDate?, KleanDate) -> KleanDate?
    {
        return { mostRecent, nextDate in
            
            guard let date = mostRecent else { return nextDate }
            
            switch date.compare(nextDate) {
            
            case .orderedAscending:
                return nextDate
                
            case .orderedDescending: fallthrough
            case .orderedSame:
                return date
            }
        }
    }
}
