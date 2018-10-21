//
//  ArticleController.swift
//  Codata
//
//  Created by Kevin Trebossen on 21/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class ArticleController: UIViewController {
    
    var liste: Liste!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Prepare for SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add", let controller = segue.destination as? AddArticleController {
            controller.liste = liste
        }
    }
    
    // PERFORM FOR SEGUE
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "Add", sender: nil)
    }

}
