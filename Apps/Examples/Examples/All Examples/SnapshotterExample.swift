import UIKit
import MapboxMaps

@objc(SnapshotterExample)

public class SnapshotterExample: UIViewController, ExampleProtocol {

    internal var mapView: MapView!
    public var snapshotter: Snapshotter!
    public var snapshotView: UIImageView!

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Create a vertical stack view to hold both the map view and the snapshot.
        let stackView = UIStackView(frame: view.safeAreaLayoutGuide.layoutFrame)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 12.0

        let testRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2)

        let mapInitOptions = MapInitOptions(cameraOptions: CameraOptions(center: CLLocationCoordinate2D(latitude: 37.858, longitude: 138.472),
                                                                         zoom: 3.5),
                                            styleURI: .dark)

        mapView = MapView(frame: testRect, mapInitOptions: mapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Add the `MapViewController`'s view to the stack view as a
        // child view controller.
        stackView.addArrangedSubview(mapView)

        // Add the image view to the stack view, which will eventually contain the snapshot.
        snapshotView = UIImageView(frame: CGRect.zero)
        stackView.addArrangedSubview(snapshotView)

        // Add the stack view to the root view.
        view.addSubview(stackView)

        // Configure the snapshotter object with its default access
        // token, size, map style, and camera.
        let options = MapSnapshotOptions(
            size: CGSize(
                width: view.bounds.size.width,
                height: view.bounds.height / 2),
            pixelRatio: UIScreen.main.scale,
            resourceOptions: mapInitOptions.resourceOptions)

        snapshotter = Snapshotter(options: options)
        snapshotter.style.uri = .light

        // Set the camera of the snapshotter
        let snapshotterCameraOptions = CameraOptions(cameraState: mapView.cameraState)
        snapshotter.setCamera(to: snapshotterCameraOptions)

        snapshotter.onNext(.styleLoaded) { [weak self] _ in
            self?.startSnapshot()
        }
    }

    public func startSnapshot() {
        snapshotter.start(overlayHandler: nil) { ( result ) in
            switch result {
            case .success(let image):
                self.snapshotView.image = image
            case .failure(let error):
                print("Error generating snapshot: \(error)")
            }
            // The below line is used for internal testing purposes only.
            self.finish()
        }
    }
}
