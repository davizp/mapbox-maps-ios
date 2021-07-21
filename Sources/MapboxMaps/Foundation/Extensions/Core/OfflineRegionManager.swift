@_spi(Internal) import MapboxCoreMaps

@available(*, deprecated)
extension OfflineRegionManager {

    // :nodoc:
    public func offlineRegions(completion: @escaping (Result<[OfflineRegion], MapboxError<String>>) -> Void) {
        getOfflineRegions(forCallback: completion)
    }

    // :nodoc:
    public func createOfflineRegion(for geometryDefinition: OfflineRegionGeometryDefinition,
                                    completion: @escaping (Result<OfflineRegion, MapboxError<String>>) -> Void) {
        createOfflineRegion(for: geometryDefinition, callback: completion)
    }

    // :nodoc:
    public func createOfflineRegion(for tilePyramidDefinition: OfflineRegionTilePyramidDefinition,
                                    completion: @escaping (Result<OfflineRegion, MapboxError<String>>) -> Void) {
        createOfflineRegion(for: tilePyramidDefinition, callback: completion)
    }

    // :nodoc:
    public func mergeOfflineDatabase(for filePath: String,
                                     completion: @escaping (Result<[OfflineRegion], MapboxError<String>>) -> Void) {
        mergeOfflineDatabase(forFilePath: filePath, callback: completion)
    }
}
