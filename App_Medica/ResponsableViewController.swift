//
//  ResponsableViewController.swift
//  App_Medica
//
//  Created by alumno on 22/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

class ResponsableViewController: UIViewController {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var correo: UITextField!
    var flag:Bool!
    
    @IBAction func guardar(_ sender: UIButton) {
        /*//Responsable
         static var nombreResp:String!
         static var RespCellNumber:String!
         static var correoResp:String!
         }*/
        
        if  nombre.hasText == false || telefono.hasText == false || correo.hasText == false{
            let alert = UIAlertController(title: "Completa datos", message: "Introduce todos los datos correctos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            flag = false
        }
        else{
        
        pacient.nombreResp = nombre.text
        pacient.RespCellNumber = telefono.text
        pacient.correoResp = correo.text
            flag = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return flag
    }

}
