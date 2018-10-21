//
//  AddArticleController.swift
//  Codata
//
//  Created by Kevin Trebossen on 21/10/2018.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class AddArticleController: UIViewController {

    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var shopTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    var picker = UIImagePickerController()
    
    var liste: Liste!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false
    }
    
    @IBAction func addArticleAction(_ sender: Any) {
    }
    
    @IBAction func pictureGallery(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func camera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }
    }
    
    

}


extension AddArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Obligatoire pour être aux normes avec le protocole
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let or = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageView.image = or
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    // Obligatoire pour être aux normes avec le protocole
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
