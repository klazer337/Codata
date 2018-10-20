//
//  ViewController.swift
//  Codata
//
//  Created by Kevin Trebossen on 20/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit
import CoreData

class ListeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var nameTF: UITextField!
    
    var listes: [Liste] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateListe()           // chargement de la liste
    }
    
    func updateListe() {
        coreDataHelper().getList { (listes) in
            if listes != nil {
                DispatchQueue.main.async {
                    self.listes = listes!
                    self.tableView.reloadData()
                }
            }
        }
    }

    
    @IBAction func addListe(_ sender: UIButton){
        coreDataHelper().saveListe(nameTF.text)
        updateListe()
    }
}

