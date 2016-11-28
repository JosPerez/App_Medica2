//
//  FotosViewController.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

class FotosViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    
    
    var image:UIImage!
    var comentarios:String!
	@IBOutlet weak var imImage: UIImageView!
	@IBOutlet weak var twComentarios: UITextView!
	

	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//Agregar bordes a los textview
		twComentarios.layer.borderWidth = 1
		twComentarios.layer.borderColor = UIColor.black.cgColor
		//Picker Controller Image
		let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
		imImage.isUserInteractionEnabled = true
		imImage.addGestureRecognizer(tap)
        
        if image != nil && comentarios != nil {
            imImage.image = image
            twComentarios.text = comentarios
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	// MARK: - Metodos de Image y con Alert sheet
	func imageTapped(img: UIImage){
		let menu = UIAlertController(title: nil, message: "Elige Una Opción", preferredStyle: .actionSheet)
		let photo = UIAlertAction(title: "Libreria Foto", style: .default, handler: {
			(alert: UIAlertAction!) -> Void in
			print("Photo library")
			let imagePicker = UIImagePickerController()
			imagePicker.delegate = self
			imagePicker.sourceType = .photoLibrary
			imagePicker.allowsEditing = false
			imagePicker.modalPresentationStyle = .fullScreen
			self.present(imagePicker,animated: true,completion: nil)
			
		})
		let camara = UIAlertAction(title: "Camara", style: .default, handler: {
			(alert:UIAlertAction!) -> Void in
			print("Camara Roll")
			let imagePicker = UIImagePickerController()
			imagePicker.delegate = self
			imagePicker.sourceType = .camera
			imagePicker.allowsEditing = false
			imagePicker.modalPresentationStyle = .fullScreen
			self.present(imagePicker,animated: true,completion: nil)
		})
		let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: {
			(alert:UIAlertAction!) -> Void in
			print("cancelled")
		})
		
		menu.addAction(photo)
		menu.addAction(camara)
		menu.addAction(cancel)
		
		self.present(menu,animated: true, completion: nil)
	}
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		var image = UIImage()
		image = info[UIImagePickerControllerOriginalImage] as! UIImage
		
		imImage.image = image
		dismiss(animated: true, completion: nil)
	}
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		let StaticView = segue.destination as! StaticTableViewController
		
		StaticView.image = imImage.image
		StaticView.comentarios = twComentarios.text

    }


}
