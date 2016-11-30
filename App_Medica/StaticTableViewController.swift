//
//  StaticTableViewController.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import UserNotifications

protocol ProtocolAgregarMedicinas {
	func agregarMedicina(nombre:String,CantidadCaja:Int,CantidadToma:Int,TipoAdimnistracion:String,HoraInicio:NSDate,intervalo:TimeInterval,image:UIImage,comentarios:String,cantDias:Int) -> Void
	func quitarVista() -> Void
}
class StaticTableViewController: UITableViewController {
	
	var nombre:String!
	var CantidadCaja:Int!
	var CantidadToma:Int!
	var TipoAdimnistracion:String!
	var HoraInicio:NSDate!
	var intervalo:TimeInterval!
	var image:UIImage!
	var comentarios:String!
	var cantDias:Int!
	
    var delegado:ProtocolAgregarMedicinas!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationItem.title = "Agregar"
		let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
		self.navigationItem.rightBarButtonItem = barButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func done(){
        
        if nombre != nil && CantidadToma != nil && CantidadToma != nil && TipoAdimnistracion != nil && HoraInicio != nil && intervalo != nil && image != nil && comentarios != nil && cantDias != nil {
            delegado.agregarMedicina(nombre: nombre, CantidadCaja: CantidadCaja, CantidadToma: CantidadToma, TipoAdimnistracion: TipoAdimnistracion, HoraInicio: HoraInicio, intervalo: intervalo, image: image, comentarios: comentarios,cantDias:cantDias)
            
            
            
            //Local Noification
            let content  = UNMutableNotificationContent()
            content.title = "Meidicina Agregada"
            content.body = nombre + " ha sido asignada"
            content.sound = .default()
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let request = UNNotificationRequest(identifier: "Creada", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {
                error in
                print (error)
            })
            
            navigationController?.popViewController(animated: true)
        }else {
            
            let alert = UIAlertController(title: "Completa datos", message: "Introduce todos los datos correctos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    
    
    }
	
    // MARK: - Navigation
 
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Basico" {
            let basico = segue.destination as! ViewController
            basico.nombre = nombre
            basico.CantidadCaja = CantidadCaja
            basico.CantidadToma = CantidadToma
            basico.TipoAdimnistracion = TipoAdimnistracion
            
        }else if segue.identifier == "Hora"{
            let basico = segue.destination as! HoraViewController
            basico.HoraInicio = HoraInicio
            basico.intervalo = intervalo
            basico.cantDias = cantDias
            
        }else if segue.identifier == "Foto" {
            let basico = segue.destination as! FotosViewController
            basico.image = image
            basico.comentarios = comentarios
            
        }
		
    }
	//MARK: - Unwind navigation methods
    @IBAction func unwindBasico(_sender: UIStoryboardSegue){
        
        
    }
    @IBAction func unwindHora(_sender: UIStoryboardSegue){
        
    }
    @IBAction func unwindFoto(_sender: UIStoryboardSegue){
        
    }
}
