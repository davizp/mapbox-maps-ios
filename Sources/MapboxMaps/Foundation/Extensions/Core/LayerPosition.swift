import MapboxCoreMaps

/// Specifies the position at which a layer will be added when using
/// `Style.addLayer`.
public enum LayerPosition: Equatable {
    /// Default behavior; add to the top of the layers stack.
    case `default`

    /// Layer should be positioned above the specified layer id.
    case above(String)

    /// Layer should be positioned below the specified layer id.
    case below(String)

    /// Layer should be positioned at the specified index in the layers stack.
    case at(UInt32)

    internal var corePosition: MapboxCoreMaps.LayerPosition {
        switch self {
        case .default:
            return MapboxCoreMaps.LayerPosition()
        case .above(let layerId):
            return MapboxCoreMaps.LayerPosition(above: layerId)
        case .below(let layerId):
            return MapboxCoreMaps.LayerPosition(below: layerId)
        case .at(let index):
            return MapboxCoreMaps.LayerPosition(at: index)
        }
    }
}
