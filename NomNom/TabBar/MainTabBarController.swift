//
//  MainTabBarController.swift
//  NomNom
//
//  Created by Jack Camas on 12/13/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().tintColor = .white
        viewControllers = [createSearchNC(), createBookMarkNC(), createMapNC()]
        
    }
    
        func createSearchNC() -> UINavigationController {
            let searchVC = SearchVC()
            //searchVC.title = "Search"
            searchVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "house"), tag: 0)
    
            return UINavigationController(rootViewController: searchVC)
        }
    
        func createBookMarkNC() -> UINavigationController {
            let bookMarkVC = BookMarkVC()
            bookMarkVC.title = "BookMark"
            bookMarkVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
            return UINavigationController(rootViewController: bookMarkVC)
        }
    
        func createMapNC() -> UINavigationController {
            let mapVC = MapVC()
            mapVC.title = "Map"
            mapVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
            return UINavigationController(rootViewController: mapVC)
        }
        
        func createTabBar() -> UITabBarController {
            let tabbar = UITabBarController()
            UITabBar.appearance().backgroundColor = .black
            UITabBar.appearance().tintColor = .white
            tabbar.viewControllers = [createSearchNC(), createBookMarkNC(), createMapNC()]
            return tabbar
        }
}
