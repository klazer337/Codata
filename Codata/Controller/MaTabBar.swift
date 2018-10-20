//
//  MaTabBar.swift
//  Codata
//
//  Created by Kevin Trebossen on 20/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class MaTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .darkGray                        // Couleur de l'icône sélectionné
        tabBar.unselectedItemTintColor = .lightGray         // Changer la couleur de l'icône qui n'ets pas selectionné
        //tabBar.barTintColor = .yellow                     // Changer le background color de la tabBar
        
        // TabBar transparente
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()               
    }
}
