import Foundation

public func fatal_klean_notImplemented(_ name: String = "") -> Never {
    fatalError("\(name) has not been implemented")
}

public func fatal_klean_doNotUse(suggestion: String) -> Never {
    fatalError("Do not use this method. Suggestion: \(suggestion)")
}

public func fatal_klean_implementErrorHandling(_ note: String = "") -> Never {
    fatalError("Need to implement error handling here and within callers:\n\(note)")
}

public func fatal_klean_abstractMethod() -> Never {
    fatalError("Abstract method -- Need to implement in subclass")
}
