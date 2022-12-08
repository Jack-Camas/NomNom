//
//  ViewController.swift
//  NomNom
//
//  Created by Jack Camas on 12/8/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func GoNext(_ sender: Any) {
        let VC = UIStoryboard(name: "MapView", bundle: nil).instantiateInitialViewController()!
        self.view.window?.rootViewController = VC
    }
}

