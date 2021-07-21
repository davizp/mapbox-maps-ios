/// Set of options for taking map snapshot with Snapshotter.
public extension MapSnapshotOptions {
    var size: CGSize {
        get {
            CGSize(_size)
        }
        set {
            _size = Size(newValue)
        }
    }

    /// Initializes a `MapSnapshotOptions`
    /// - Parameters:
    ///   - size: Dimensions of the snapshot in points
    ///   - pixelRatio: Ratio of device-independent and screen pixels.
    ///   - glyphsRasterizationOptions: Glyphs rasterization options to use for
    ///         client-side text rendering. Default mode is
    ///         `.ideographsRasterizedLocally`
    ///   - resourceOptions: Resource fetching options to be used by the
    ///         snapshotter. Default uses the access token provided by
    ///         `ResourceOptionsManager.default`
    init(size: CGSize,
         pixelRatio: Float,
         glyphsRasterizationOptions: GlyphsRasterizationOptions = GlyphsRasterizationOptions(),
         resourceOptions: ResourceOptions = ResourceOptionsManager.default.resourceOptions) {
        precondition(pixelRatio > 0)
        precondition(size.width * CGFloat(pixelRatio) <= 8192, "Width or scale too great.")
        precondition(size.height * CGFloat(pixelRatio) <= 8192, "Height or scale too great.")

        self.init(
            _size: Size(size),
            pixelRatio: pixelRatio,
            glyphsRasterizationOptions: glyphsRasterizationOptions,
            resourceOptions: resourceOptions)
    }
}
