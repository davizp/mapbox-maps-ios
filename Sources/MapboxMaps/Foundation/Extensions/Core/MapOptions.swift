extension MapboxCoreMaps.MapOptions {
    public init(constrainMode: ConstrainMode?,
                viewportMode: ViewportMode?,
                orientation: NorthOrientation?,
                crossSourceCollisions: Bool?,
                optimizeForTerrain: Bool?,
                size: CGSize?,
                pixelRatio: Float = Float(UIScreen.main.scale),
                glyphsRasterizationOptions: GlyphsRasterizationOptions?) {
        self.init(_contextMode: nil,
                  constrainMode: constrainMode,
                  viewportMode: viewportMode,
                  orientation: orientation,
                  crossSourceCollisions: crossSourceCollisions,
                  optimizeForTerrain: optimizeForTerrain,
                  size: size.map(Size.init(_:)),
                  pixelRatio: pixelRatio,
                  glyphsRasterizationOptions: glyphsRasterizationOptions)
    }

    public var size: CGSize? {
        _size.map(CGSize.init(_:))
    }
}
