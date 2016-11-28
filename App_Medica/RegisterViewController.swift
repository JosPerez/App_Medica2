//
//  RegisterViewController.swift
//  App_Medica
//
//  Created by alumno on 03/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

let pacient = paciente()
class RegisterViewController: UIViewController {

	
	
    @IBOutlet weak var tvDescripcion: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Check if is a connection
        //Logging in check
        
        // Do any additional setup after loading the view.
        tvDescripcion.layer.borderWidth = 1.5
        tvDescripcion.layer.borderColor = UIColor(red: 28/255, green: 165/255, blue: 117/255, alpha: 0.7).cgColor
        view.backgroundColor = UIColor.white

        
        
    }
	@IBAction func btContinuar(_ sender: UIButton) {
		
		if pacient.nombre != nil && pacient.edad != nil && pacient.sexo != nil && pacient.nombreResp != nil && pacient.correoDoc != nil && pacient.RespCellNumber != nil {
			
            
            
            FIRAuth.auth()?.createUser(withEmail: pacient.correoResp, password: String(pacient.RespCellNumber), completion:  {
                (user: FIRUser?, error) in
                
                if error != nil {
                    print(error)
                }
                guard let uid = user?.uid else {
                    return
                }
                
                let ref = FIRDatabase.database().reference(fromURL: "https://mediapp-54028.firebaseio.com/")
                _ = ref.child("pacient Info").child(uid)
                let value = ["nombre":pacient.nombre,"edad":pacient.edad,"sexo": pacient.sexo,"nombreResp": pacient.nombreResp,"correoResp": pacient.correoResp,"RespCellNumber":pacient.RespCellNumber] as [String : Any]
                
                ref.updateChildValues(value, withCompletionBlock: {
                    (err, ref) in
                    
                    if err != nil {
                        print(err)
                    }
                })
            })
            
            
            
            UserDefaults.standard.setValue(NSKeyedArchiver.archivedData(withRootObject: pacient), forKey: "ID")
			
		}else {
			let alert = UIAlertController(title: "Completa datos", message: "Introduce todos los datos", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
			present(alert, animated: true, completion: nil)
		}
		
		
	}
    
    
    //MARK: - Metodos Unwind 
    @IBAction func unwindUsuario(_sender: UIStoryboardSegue){
		
    }
    @IBAction func unwindDoctor(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindRespo(sender: UIStoryboardSegue) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
