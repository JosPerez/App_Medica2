//
//  ViewController.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
	
    var nombre:String!
    var CantidadCaja:Int!
    var CantidadToma:Int!
    var TipoAdimnistracion:String!
    
	@IBOutlet weak var tfNombreMedicamento: UITextField!
	//Stepper y label de canidad de pastillas para la caja
	@IBOutlet weak var lbCantidadCaja: UILabel!
	@IBAction func stpCantidadCaja(_ sender: UIStepper) {
		lbCantidadCaja.text = "\(Int(sender.value))"
	}
	//Steper y label de cantidad por toma
	@IBOutlet weak var lbCantidadToma: UILabel!
	@IBAction func stpCantidadToma(_ sender: UIStepper) {
		lbCantidadToma.text = "\(Int(sender.value))"
	}
	//Variables para Tipo de toma
	@IBOutlet weak var tfTipoToma: UITextField!
	var arrTipoToma = ["---","Oral","Sublingual","Topica","Oftalmica","Intranasal","Supositorios"]
	//Guardar Button

	
	override func viewDidLoad() {
		super.viewDidLoad()
		//Crear y usar el UIPickerview como teclado
		let picker = UIPickerView()
		picker.delegate = self
		tfTipoToma.inputView = picker
			//Crear el Tap bar arriba del pickerview
		let toolbar = UIToolbar()
		toolbar.barStyle = UIBarStyle.default
		toolbar.isTranslucent = true
		toolbar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha:1)
		toolbar.sizeToFit()
			//Crear Botones
		let doneButton = UIBarButtonItem(title: "Done",style:UIBarButtonItemStyle.plain,target: self, action: #selector(quitarTeclado))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
		let Cancelbutton = UIBarButtonItem(title: "Cancel",style:UIBarButtonItemStyle.plain,target: self, action: #selector(doneBut))
			//Asignar los valores
		toolbar.setItems([Cancelbutton,spaceButton,doneButton], animated: false)
		toolbar.isUserInteractionEnabled = true
		tfTipoToma.inputAccessoryView = toolbar
        
        if nombre != nil && CantidadToma != nil && CantidadToma != nil && TipoAdimnistracion != nil {
            tfNombreMedicamento.text = nombre
            lbCantidadCaja.text = String(CantidadCaja)
            lbCantidadToma.text = String(CantidadToma)
            tfTipoToma.text = TipoAdimnistracion
        }
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		quitarTeclado()
	}
	func quitarTeclado()
	{
		view.endEditing(true)
	}
	func doneBut(){
		tfTipoToma.text = ""
		quitarTeclado()
	}
	//MARK: - MEtodos de Source Data Pickerview
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return arrTipoToma.count
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
	{
			return arrTipoToma[row]
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		tfTipoToma.text = arrTipoToma[row]
	}
	//MARK: - Metodos de Navegación
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		let Staticview = segue.destination as! StaticTableViewController
		
		Staticview.nombre = tfNombreMedicamento.text
		Staticview.CantidadCaja = Int(lbCantidadCaja.text!)
		Staticview.CantidadToma = Int(lbCantidadToma.text!)
		Staticview.TipoAdimnistracion = tfTipoToma.text
	}
}

