//
//  DetailViewController.swift
//  App_Medica
//
//  Created by alumno on 02/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var imMedicina: UIImageView!
    @IBOutlet weak var lbATomar: UILabel!
    @IBOutlet weak var lbRestantes: UILabel!
    @IBOutlet weak var lbIntervalo: UILabel!
    @IBOutlet weak var lbViaAdmin: UILabel!
    @IBOutlet weak var tvComentarios: UITextView!
	@IBOutlet weak var lbDuracion: UILabel!
    
    var nombre:String!
    var image:UIImage!
    var tomar:Int!
    var Restantes:Int!
    var Intervalo:TimeInterval!
    var ViaAdmin:String!
    var cometarios:String!
	var duracion:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbNombre.text = nombre
        imMedicina.image = image
        lbATomar.text = String(tomar)
        lbRestantes.text = String(Restantes)
        let enHoras = Int(Intervalo/3600)
        lbIntervalo.text = "\(enHoras) horas"
        lbViaAdmin.text = ViaAdmin
        tvComentarios.layer.borderWidth = 1
        tvComentarios.layer.borderColor = UIColor.black.cgColor
        tvComentarios.text = cometarios
		if duracion == 999999 {
			lbDuracion.text = "Siempre"
		}else {
			lbDuracion.text = String(duracion) + " días"
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
