//
//  MapViewController.swift
//  NomNom
//
//  Created by Life on 12/15/22.
//

import UIKit
import MapboxMaps

class MapViewController: UIViewController {
    
    var mapView: MapView!
    var accessToken: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResourceOptionsManager.default.resourceOptions.accessToken = self.accessToken
        mapView = MapView(frame: view.bounds)
        view.addSubview(mapView)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
