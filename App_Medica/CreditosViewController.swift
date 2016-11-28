//
//  CreditosViewController.swift
//  App_Medica
//
//  Created by alumno on 15/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit

class CreditosViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
