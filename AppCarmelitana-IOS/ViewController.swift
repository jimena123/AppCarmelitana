//
//  ViewController.swift
//  AppCarmelitana-IOS
//
//  Created by JIMENA LOPEZ on 11/27/19.
//  Copyright © 2019 JIMENA LOPEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var table: UITableView!
    var menuVc : MenuViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menuVc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToGesture(gesture : UISwipeGestureRecognizer)
    {
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            print("Right Swipe")
            showMenu()
        case UISwipeGestureRecognizer.Direction.left:
                   print("Left Swipe")
            close_on_swipe()
        default:
            break
        }
        
    }
    
 
    @IBAction func menu(_ sender: UIBarButtonItem) {
    //shoe menu
        
        if AppDelegate.menu_bool{
            showMenu()
        }
        else
        {
            closeMenu()
        }
    }
    
    func close_on_swipe()
    {
        if AppDelegate.menu_bool{
           // showMenu()
        }else
        {
            closeMenu()
        }
    }
    
    func showMenu()
    {
        UIView.animate(withDuration: 0.3)
        {()->Void in
            self.menuVc.view.frame = CGRect(x: 0, y: 85, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.menuVc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChild(self.menuVc)
            self.view.addSubview(self.menuVc.view)
            AppDelegate.menu_bool = false
        }
       
       
    }
    func closeMenu()
    {
        UIView.animate(withDuration: 0.3, animations: { ()->Void in
                
                 self.menuVc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.menuVc.view.removeFromSuperview()
            
        }
         AppDelegate.menu_bool = true
    }

}

