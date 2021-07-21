@_spi(Internal) import MapboxCoreMaps

extension CameraOptions {
    public init(center: CLLocationCoordinate2D? = nil, padding: UIEdgeInsets? = nil, anchor: CGPoint? = nil, zoom: Double? = nil, bearing: Double? = nil, pitch: Double? = nil) {
        self.init(
            _center: center,
            padding: padding?.toMBXEdgeInsetsValue(),
            anchor: anchor?.screenCoordinate,
            zoom: zoom,
            bearing: bearing,
            pitch: pitch)
    }

    var padding: UIEdgeInsets? {
        get {
            _padding?.toUIEdgeInsetsValue()
        }
        set {
            _padding = newValue?.toMBXEdgeInsetsValue()
        }
    }

    var anchor: CGPoint? {
        get {
            _anchor?.point
        }
        set {
            _anchor = newValue?.screenCoordinate
        }
    }
}
