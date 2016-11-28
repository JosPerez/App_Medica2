//
//  ProfileViewController.swift
//  App_Medica
//
//  Created by Jose Eduardo Perez Martinez on 03/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

class ProfileViewController: UIViewController {

	
	//Outlet usuario
	@IBOutlet weak var imUsuario: UIImageView!
	@IBOutlet weak var lbNombre: UILabel!
	@IBOutlet weak var lbEdad: UILabel!
	@IBOutlet weak var lbSexo: UILabel!
    @IBOutlet weak var lbDoctor: UILabel!
    
    @IBOutlet weak var lbContacto: UILabel!
    @IBOutlet weak var lbCorreoConta: UILabel!
    @IBOutlet weak var lbNumeroDoc: UILabel!
    
    @IBOutlet weak var lbCorreoResp: UILabel!
    @IBOutlet weak var lbCorreoDoc: UILabel!
    @IBOutlet weak var lbNumeroConta: UILabel!
	
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        //Customize navigation bar
        let bar = navigationController?.navigationBar
        bar?.barStyle = .blackTranslucent
        bar?.tintColor = UIColor.white
        bar?.barTintColor = UIColor(red: 123/255, green: 204/255, blue: 255/255, alpha: 1)
		
        
        let data = UserDefaults.standard.object(forKey: "ID")
        let pac = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! paciente
        
		//Asignar Valores usuario
		imUsuario.image = pac.imagen
		lbNombre.text = pac.nombre
		lbEdad.text = String(pac.edad)
        lbSexo.text = pac.sexo
        lbContacto.text = pac.nombreResp
        lbCorreoResp.text = pac.correoResp
        lbCorreoDoc.text = pac.correoDoc
        lbNumeroDoc.text = pac.cellNumber
        lbNumeroConta.text = pac.RespCellNumber
        
        
        if pac.nombreDoc == nil {
            lbDoctor.text = "No especificado"
        }else {
            lbDoctor.text = pac.nombreDoc
        }
        
        if pac.correoDoc == nil {
            lbCorreoDoc.text = "No especificado"
        }else {
            lbCorreoDoc.text = pac.correoDoc
        }
        
        if pac.cellNumber == nil {
            lbNumeroDoc.text = "No especificado"
        }else {
            lbNumeroDoc.text = pac.cellNumber
        }
        
        if pac.nombreResp == nil {
            lbContacto.text = "No especificado"
        }else {
            lbContacto.text = pac.nombreResp
        }
        
        if pac.correoResp == nil {
            lbCorreoResp.text = "No especificado"
        }else {
            lbCorreoResp.text = pac.correoResp
        }
        
        if pac.RespCellNumber == nil {
            lbNumeroConta.text = "No especificado"
        }else {
            lbNumeroConta.text = pac.RespCellNumber
        }
        
        
        
        
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
