//
//  ListeCell.swift
//  Codata
//
//  Created by Kevin Trebossen on 21/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class ListeCell: UITableViewCell {

    @IBOutlet weak var nameLBL: UILabel!
    
    @IBOutlet weak var dateLBL: UILabel!
    
    var liste: Liste!
    
    func setupCell(liste: Liste) {
        self.liste = liste
        nameLBL.text = self.liste.name
        if self.liste.date != nil {
            dateLBL.text = "Crée le " + self.liste.date!.toString()
        } else {
            dateLBL.text = "Aucune date disponible"
        }
    }
}
