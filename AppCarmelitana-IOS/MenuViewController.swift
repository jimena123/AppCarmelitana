//
//  MenuViewController.swift
//  AppCarmelitana-IOS
//
//  Created by JIMENA LOPEZ on 11/27/19.
//  Copyright © 2019 JIMENA LOPEZ. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    let titleArray = ["Preces Carmelitanas" , "Angelus SanJuanista" , "Sobre Nosotros" ,"Configuracion" , "Facebook" , "Sitio Web"]
    let UIImageView = ["angelus" ]
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTableView.delegate = self
        menuTableView.dataSource = self
     }
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
     }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu-cell") as! MenuTableViewCell
        
        cell.labelTitle.text = titleArray[indexPath.row]
        return cell
      }
    func tableview(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "home-cell") as! MenuTableViewCell
           
           cell.labelTitle.text = titleArray[indexPath.row]
                return cell
    }
   
    

}
