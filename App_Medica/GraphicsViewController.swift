//
//  GraphicsViewController.swift
//  App_Medica
//
//  Created by alumno on 03/11/16.
//  Copyright © 2016 815968. All rights reserved.
//

import UIKit
import UserNotifications

class GraphicsViewController: UITableViewController {

    
    

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var refControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        refControl = UIRefreshControl()
        refControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refControl.addTarget(self, action: Selector(("refresh:")), for: UIControlEvents.valueChanged)
       
    }
    func refresh(sender:AnyObject) {
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taken.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! HistorialCell
        
        cell.nombre.text = taken[indexPath.row].nombre
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        cell.hora.text = formatter.string(from: taken[indexPath.row].hora as Date)
        cell.medImagen.image = taken[indexPath.row].image
        if !taken[indexPath.row].tomada {
            
            cell.nombre.tintColor = UIColor.red
        }
        
        
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
