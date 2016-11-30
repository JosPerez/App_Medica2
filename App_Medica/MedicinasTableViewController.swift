//
//  MedicinasTableViewController.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import UserNotifications

struct tomadas {
    var nombre:String!
    var hora:NSDate!
    var tomada:Bool!
    var image:UIImage!
}
var taken = [tomadas]()

class MedicinasTableViewController: UITableViewController,ProtocolAgregarMedicinas,UNUserNotificationCenterDelegate {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
	var medicina = [Medicinas]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
		UNUserNotificationCenter.current().delegate = self
        
        //Side menu 
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
        
        
        if UserDefaults.standard.object(forKey: "medicina") != nil{
            
            let medDa = UserDefaults.standard.object(forKey: "medicina")
            medicina = NSKeyedUnarchiver.unarchiveObject(with: medDa as! Data) as! [Medicinas]
            
        }
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicina.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
		
		cell.imimage.image = medicina[indexPath.row].image
        cell.lbNombre.text = medicina[indexPath.row].nombre
        let hora:NSDate = medicina[indexPath.row].HoraInicio
        let interval:TimeInterval = medicina[indexPath.row].intervalo
        medicina[indexPath.row].HoraInicio = hora.addingTimeInterval(interval)
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
		
		let string = String(interval/3600)
        cell.lbHoratoma.text = "cada: " + string + " hrs."
		cell.lbCantidadRest.text = "Restan: " + "\(Int(medicina[indexPath.row].CantidadCaja))"

        return cell
    }
    
    
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let staticview = segue.destination as! StaticTableViewController
            staticview.delegado = self
        }else if segue.identifier == "detail" {
            let detail = segue.destination as! DetailViewController
            let index:IndexPath = tableView.indexPathForSelectedRow!
            detail.nombre = medicina[index.row].nombre
            detail.image = medicina[index.row].image
            detail.tomar = medicina[index.row].CantidadToma
            detail.Restantes = medicina[index.row].CantidadCaja
            detail.Intervalo = medicina[index.row].intervalo
            detail.ViaAdmin = medicina[index.row].TipoAdimnistracion
            detail.cometarios = medicina[index.row].comentarios
			detail.duracion = medicina[index.row].cantDias
        }
    }
	func agregarMedicina(nombre:String,CantidadCaja:Int,CantidadToma:Int,TipoAdimnistracion:String,HoraInicio:NSDate,intervalo:TimeInterval,image:UIImage,comentarios:String,cantDias:Int){
		let medic = Medicinas.init(nombre: nombre, CantidadCaja: CantidadCaja, CantidadToma: CantidadToma, TipoAdimnistracion: TipoAdimnistracion, HoraInicio: HoraInicio, intervalo: intervalo, image: image, comentarios: comentarios,cantDias:cantDias)
		
		medicina.append(medic)
        
        UserDefaults.standard.setValue(NSKeyedArchiver.archivedData(withRootObject: medicina), forKey: "medicina")
        
        //Notification with action
        let content  = UNMutableNotificationContent()
        content.title = "Tomar Medicina"
        content.body = nombre + ": Tomar " + String(CantidadToma) + " pastillas"
        content.sound = .default()
        content.categoryIdentifier = "myCategory"
        
        let str = String(medicina.count)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: intervalo, repeats: true)
        let request = UNNotificationRequest(identifier: str, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {
            error in
            print (error)
        })
        
        
        tableView.reloadData()
	}
	func quitarVista(){
		dismiss(animated: true, completion: nil)
    }
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
            
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [String(indexPath.row)])
			medicina.remove(at: (indexPath as NSIndexPath).row)
			UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: medicina), forKey: "medicina")
			tableView.reloadData()
            
            
		}
	}
  
    // MARK: - Notificacion
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        
        if response.actionIdentifier == "tomar" {
            let medId = Int(response.notification.request.identifier)! - 1
        
            print(medicina[medId].CantidadCaja)
            medicina[medId].CantidadCaja = medicina[medId].CantidadCaja - medicina[medId].CantidadToma
            print(medicina[medId].CantidadCaja)
            
            var take = tomadas()
            take.nombre = medicina[medId].nombre
            take.hora = response.notification.date as NSDate
            take.tomada = true
            take.image = medicina[medId].image
            taken.append(take)
            tableView.reloadData()
            
            
        }else if response.actionIdentifier == "no-tomar" {
            let medId = Int(response.notification.request.identifier)! - 1
            var take = tomadas()
            take.nombre = medicina[medId].nombre
            take.hora = response.notification.date as NSDate
            take.tomada = true
            take.image = medicina[medId].image
            taken.append(take)
            
        }else  {
            
            
        }
    }

}
    







