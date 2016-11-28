
//
//  UserViewController.swift
//  App_Medica
//
//  Created by Jose Eduardo Perez Martinez on 03/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

	@IBOutlet weak var tfNombre: UITextField!
	@IBOutlet weak var tfEdad: UITextField!
	@IBOutlet weak var scSexo: UISegmentedControl!
	@IBOutlet weak var imImage: UIImageView!
	
    var opcion : Bool = true
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		imImage.image = UIImage(named: "user-2-icon")
        tfNombre.text = nil
        tfEdad.text = nil
        //Picker image
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imImage.isUserInteractionEnabled = true
        imImage.addGestureRecognizer(tap)
        
        
        
    }
    func imageTapped(img:UIImage){
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}

    @IBAction func btnGuardar(_ sender: UIButton) {
        
        opcion = false
        if tfNombre.hasText == false || tfEdad.hasText == false {
            let alert = UIAlertController(title: "Completa datos", message: "Introduce todos los datos correctos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else{
        opcion = true
        }
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
    
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		
			if tfNombre.text != nil || (tfEdad.text != nil)  {
                
				if imImage.image == UIImage(named: "user-2-icon"){
                    
					imImage.image = UIImage(named: "user-2-icon")
					
				}
				pacient.nombre = tfNombre.text
				pacient.edad = Int(tfEdad.text!)
				pacient.sexo = scSexo.titleForSegment(at: scSexo.selectedSegmentIndex)
				pacient.imagen = imImage.image
			}else {
				
				let alert = UIAlertController(title: "Completa datos", message: "Introduce todos los datos correctos", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
				present(alert, animated: true, completion: nil)
				
			}
		
	}

	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		if tfNombre.text != nil && tfEdad.text != nil && opcion == true {
			return true
		}
		return false
	}

}
