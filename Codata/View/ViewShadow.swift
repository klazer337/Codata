//
//  ViewShadow.swift
//  Codata
//
//  Created by Kevin Trebossen on 21/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class ViewShadow: UIView {
    
    override init(frame: CGRect) {                  // Obligatoire
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {       // Obligatoire
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.75
    }
    
    
}
