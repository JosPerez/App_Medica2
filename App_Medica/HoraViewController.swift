//
//  HoraViewController.swift
//  App_Medica
//
//  Created by alumno on 20/10/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

struct señal {
	static var s:Bool!
}

class HoraViewController: UIViewController {

	var HoraInicio:NSDate!
	var intervalo:TimeInterval!
	var cantDias:Int!
	
    
	//Texfield con DatePicker
    let datePickerView = UIDatePicker()
    let datePickerView2 = UIDatePicker()
    //FUNCTIONS
	@IBOutlet weak var tfInicio: UITextField!
	@IBAction func tfHoraInicio(_ sender: UITextField) {
		
		
		datePickerView.addTarget(self, action: #selector(datepickerValueChange), for: .valueChanged)
	}
	@IBOutlet weak var tfMuestraIntervalo: UITextField!
	@IBAction func tfIntervalo(_ sender: UITextField) {
		
				datePickerView2.addTarget(self, action: #selector(datepickerValue), for: .valueChanged)
	}
	@IBOutlet weak var vwDias: UIView!
	@IBOutlet weak var tfCantDias: UITextField!
	
	
	@IBAction func swFlag(_ sender: UISwitch) {
		
		if sender.isOn {
			vwDias.isHidden = true
			señal.s = true
			
		}else {
			vwDias.isHidden = false
			señal.s = false
			
		}
	}

	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        datePickerView.datePickerMode = .time
        tfInicio.inputView = datePickerView
        datePickerView2.datePickerMode = .countDownTimer
        tfMuestraIntervalo.inputView = datePickerView2
        // Do any additional setup after loading the view.
		señal.s = true
		vwDias.isHidden = true
        
        if HoraInicio != nil && intervalo != nil && cantDias != nil {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            tfInicio.text = formatter.string(from: HoraInicio as Date)
            tfMuestraIntervalo.text = String(intervalo/3600) + " horas " + String((intervalo.truncatingRemainder(dividingBy: 3600))*60) + "minutos"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	func quitarTeclado() {
		view.endEditing(true)
	}
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		quitarTeclado()
	}
	//MARK: - Metodos de Date picker
	func datepickerValueChange(_sender:UIDatePicker){
		let Formatter = DateFormatter()
		Formatter.dateStyle = .short
		Formatter.timeStyle = .short
		HoraInicio = _sender.date as NSDate!
		tfInicio.text = Formatter.string(from: _sender.date)
	}
	
	func datepickerValue(_sender:UIDatePicker){
		let Formatter = DateFormatter()
		Formatter.dateStyle = .short
		Formatter.timeStyle = .short
		intervalo = _sender.countDownDuration
		let hora = Int(_sender.countDownDuration/3600)
		let min = Int((_sender.countDownDuration.truncatingRemainder(dividingBy:3600 ))/60)
		if(hora == 1){
			if(min == 1) {
				tfMuestraIntervalo.text = "\(hora) hora, \(min) minuto"
			}else {
				tfMuestraIntervalo.text = "\(hora) hora, \(min) minutos"
			}
		}else {
			if(min == 1) {
				tfMuestraIntervalo.text = "\(hora) horas, \(min) minuto"
			}else {
				tfMuestraIntervalo.text = "\(hora) horas, \(min) minutos"
			}
		}
	}
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		let StaticView = segue.destination as! StaticTableViewController
		if señal.s == true{
			StaticView.HoraInicio = HoraInicio
			StaticView.intervalo = intervalo
			StaticView.cantDias = 999999
		}else {
			StaticView.HoraInicio = HoraInicio
			StaticView.intervalo = intervalo
			StaticView.cantDias = Int(tfCantDias.text!)
			
		}
		
    }
	

}
