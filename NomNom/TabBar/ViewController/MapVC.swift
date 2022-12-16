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
