//
//  MapVC.swift
//  NomNom
//
//  Created by Jack Camas on 12/12/22.
//

import UIKit
import MapboxMaps


class MapVC: UIViewController {

    var mapView: MapView!
    var accessToken: String = "pk.eyJ1IjoiZmNhbWFzZGV2IiwiYSI6ImNsYmZsd2ltMjAwcHQzd3Bndm5rNHhzMXUifQ.Kht_leUC3luF0RPopMNp6Q"
    

    var myBackgroundLayer = BackgroundLayer(id: "my-background-layer")
    lazy var moodSelectionVC = UIStoryboard(name: "BottomSheet", bundle: nil).instantiateViewController(withIdentifier: "bottomSheet")
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        loadMapBox()
        loadStyle()
       // loadRestrictedBounds()
       // loadCamara()
       // loadCamaraShape()
       // loadSetCamaraBounds()
       // loadNewBGLayer()
      //  loadLocalizationSpanish()
        
        let allItem = [cordinatesM(lat: 40.7128, long: -74.0060),
                       cordinatesM(lat: 40.1128, long: -74.1060),
                       cordinatesM(lat: 40.2128, long: -74.2060),
                       cordinatesM(lat: 41.7128, long: -75.0060),
                       cordinatesM(lat: 41.1128, long: -75.1060),
                       cordinatesM(lat: 41.2128, long: -75.2060)
        
        ]
        loadPointAnotation(allItem: allItem)
     
    }
    
   func loadMapBox(){
       
       ResourceOptionsManager.default.resourceOptions.accessToken = self.accessToken
       mapView = MapView(frame: view.bounds)
     
       view.addSubview(mapView)
       
    }
    
    func loadStyle() {
        mapView.mapboxMap.loadStyleURI(.streets) { result in
            switch result {
            case .success(let style):
                print("The map has finished loading the style")
                // Do something with `style`

            case let .failure(error):
                print("The map failed to load the style: \(error)")
            }
        }
    }
    
    
   func loadCamara(){
       let centerCoordinate = CLLocationCoordinate2D(latitude: 21.3069,
                                                      longitude: -157.8583)
       // Create a camera
       let camera = CameraOptions(center: centerCoordinate, zoom: 14)

       let options = MapInitOptions(cameraOptions: camera)
       let mapView = MapView(frame: view.bounds, mapInitOptions: options)
       view.addSubview(mapView)
    }
  


    func loadCamaraShape(){
        let coordinates = [
            CLLocationCoordinate2DMake(24, -89),
            CLLocationCoordinate2DMake(24, -88),
            CLLocationCoordinate2DMake(26, -88),
            CLLocationCoordinate2DMake(26, -89),
            CLLocationCoordinate2DMake(24, -89)
        ]
        let camera = mapView.mapboxMap.camera(for: coordinates,
                                              padding: .zero,
                                              bearing: nil,
                                              pitch: nil)
        mapView.camera.ease(to: camera, duration: 100.0)
    }
    
    func loadSetCamaraBounds(){
        let sw = CLLocationCoordinate2DMake(-21.3069, -157.8583)
        let ne = CLLocationCoordinate2DMake(-20.3069, -158.8583)
        let restrictedBounds = CoordinateBounds(southwest: sw, northeast: ne)
        try? mapView.mapboxMap.setCameraBounds(with: CameraBoundsOptions(bounds: restrictedBounds,
                                                                        maxZoom: 15.0,
                                                                        minZoom: 8.0))
    }
    
    func loadNewBGLayer(){
        myBackgroundLayer.backgroundColor = .constant(StyleColor(.red))
        try? mapView.mapboxMap.style.addLayer(myBackgroundLayer)
    }

    
    func loadLocalizationSpanish(){
        try? mapView.mapboxMap.style.localizeLabels(into: Locale(identifier: "es"))
        //view.addSubview(mapView)
    }
    
    func loadPointAnotation(allItem:[cordinatesM]){
        
        
        for item in allItem{
            
    
            
            let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
            
            // var customCoordinate =  CLLocationCoordinate2DMake(40.7128, -74.0060),
            pointAnnotationManager.delegate = self
            // Initialize a point annotation with a geometry ("coordinate" in this case)
            // and configure it with a custom image (sourced from the asset catalogue)
            var customPointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2DMake(item.lat, item.long))
            
            // Make the annotation show a red pin. See /ios/maps/examples/point-annotation/ for a complete example.
            customPointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
            
            // Add the annotation to the manager in order to render it on the mao.
            pointAnnotationManager.annotations = [customPointAnnotation]
            
        }
    }

    @available(iOS 16.0, *)
    func bottomSheet() {
        
        if let sheet = moodSelectionVC.sheetPresentationController{
            sheet.detents = [.custom(resolver: { context in
                return CGFloat(100.00)
            }), .medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 25
        }
        self.present(moodSelectionVC, animated: true, completion: nil)
    }
    
}

extension MapVC: AnnotationInteractionDelegate {
    public func annotationManager(_ manager: AnnotationManager,
                                  didDetectTappedAnnotations annotations: [Annotation]) {
        
      print(annotations)
    }
    
}


struct cordinatesM  {
    
    var lat:Double
    var long:Double
    
}
