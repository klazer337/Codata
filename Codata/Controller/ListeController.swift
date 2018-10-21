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
    @IBOutlet weak var holderView: ViewShadow!
    @IBOutlet weak var nameTF: UITextField!
    
    var listes: [Liste] = []    // Array de liste vide au début

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self                           // Delegate
        tableView.dataSource = self                         // DataSource
        tableView.tableFooterView = UIView()                // permet d'arrêter l'affichage des row si il y a plus d'élément dans la liste
        nameTF.delegate = self
        updateListe()           // chargement de la liste
    }
    
    func updateListe() {
        CoreDataHelper().getList { (listes) in
            if listes != nil {
                DispatchQueue.main.async {              // Revenir sur la queue principale
                    self.listes = listes!
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Article",let controller = segue.destination as? ArticleController {
            controller.liste = sender as? Liste
        }
    }

    
    @IBAction func addListe(_ sender: UIButton){
        view.endEditing(true)
        CoreDataHelper().saveListe(nameTF.text)
        updateListe()
        nameTF.text = nil
    }
}

// Delegate et DataSources

extension ListeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListeCell") as? ListeCell {
            cell.setupCell(liste: listes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    // Hauteur de la row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // Suppression d'un élément
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let listeASupprimer = listes[indexPath.row]
            listes.remove(at: indexPath.row)
            CoreDataHelper().deleteListe(listeASupprimer)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Article", sender: listes[indexPath.row])
    }
    
}

extension ListeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()    // Fermer après
        return true
    }
}
