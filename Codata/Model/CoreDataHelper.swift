//
//  CoreDataHelper.swift
//  Codata
//
//  Created by Kevin Trebossen on 20/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit
import CoreData

// Nécessaire pour la récupération des données
typealias ListeCompletion = (_ listes: [Liste]?) -> Void

class CoreDataHelper {
    
    // Récuprérer base CoreData
    private let appDel = UIApplication.shared.delegate as! AppDelegate
    
    // Récupérer le contexte
    var context: NSManagedObjectContext {
        return appDel.persistentContainer.viewContext
    }
    
    // Sauvegarder dans CoreData
    func save() {                   // fonction pour sauvegarder une donnée
        appDel.saveContext()
    }
    
    
    ////////////    Logique Entity Liste    ////////////
    
    // Sauvegarde de la liste
    func saveListe(_ string: String?) {
        guard let texte = string, texte != "" else { return }
        let nouvelleListe = Liste(context: context)
        nouvelleListe.date = Date()
        nouvelleListe.name = texte
        save()
        print("Sauvegardé")
    }
    
    func getList(completion: ListeCompletion?) {
        let fetchRequest: NSFetchRequest<Liste> = Liste.fetchRequest()                  // Requête des éléments Liste dans CoreData
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)             // Tri-classement de la liste (façon de trier les données
        fetchRequest.sortDescriptors = [sortDescriptor]                                 // On donne cette façon de trier les données à la requête
        do {
            let listes = try context.fetch(fetchRequest)
            for l in listes {
                print(l.name)
            }
            completion?(listes)
        } catch {                                               // En cas d'erreur
            completion?(nil)
            print(error.localizedDescription)
        }
    }
}
