import Foundation
import CoreLocation

extension CameraBoundsOptions {

    /// Initialize a `CameraBoundsOptions` from the immutable `CameraBounds` type
    /// - Parameter cameraBounds: `CameraBounds`
    public init(cameraBounds: CameraBounds) {
        bounds = cameraBounds.bounds
        maxZoom = Double(cameraBounds.maxZoom)
        minZoom = Double(cameraBounds.minZoom)
        maxPitch = Double(cameraBounds.maxPitch)
        minPitch = Double(cameraBounds.minPitch)
    }
}
