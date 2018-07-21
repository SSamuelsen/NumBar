//
//  MenuViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/16/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var macAnalyzeButtonOutlet: Button!
    @IBOutlet weak var computerFormButtonOutlet: Button!
    @IBOutlet weak var viewFormsButtonOutlet: Button!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func macAnalyzeButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "NumBar", sender: self)            //go to the number analyzer
        
        
        
    }
    
    
    
    @IBAction func computerFormButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "compForm", sender: self)      //go to the form creator
        
    }
    
    
    @IBAction func viewFormsButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "viewForms", sender: self)
        
    }
    
    

}
