import Foundation

internal protocol CoreErrorRepresentable: Error {
    associatedtype CoreErrorType
    init(coreError: CoreErrorType)
}
