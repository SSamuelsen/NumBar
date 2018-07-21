//
//  FormViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/16/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit
import CoreData

struct form {
    
    var newHireSwitch: UISwitch
    var leaseReturnSwitch: UISwitch
    var replaceSwitch: UISwitch
    var wipedSwitch: UISwitch
    var collectionSwitch: UISwitch
    var imagedSwitch: UISwitch
    var driversSwitch: UISwitch
    var primaryUserSwitch: UISwitch
    var softwareSwitch: UISwitch
    
    var employeeName: UITextField
    var departmentName: UITextField
    var employeeNumber: UITextField
    var ticketNumber: UITextField
    var pcName: UITextField
    var macAddress: UITextField
    var deskNumber: UITextField
    var dueDate: UITextField
    
    
    
}


class FormViewController: UIViewController {
    //switches
    @IBOutlet weak var newHireSwitch: UISwitch!
    @IBOutlet weak var leaseReturnSwitch: UISwitch!
    @IBOutlet weak var replaceSwitch: UISwitch!
    @IBOutlet weak var wipedSwitch: UISwitch!
    @IBOutlet weak var collectionSwitch: UISwitch!
    @IBOutlet weak var imagedSwitch: UISwitch!
    @IBOutlet weak var driversSwitch: UISwitch!
    @IBOutlet weak var primaryUserSwitch: UISwitch!
    @IBOutlet weak var softwareSwitch: UISwitch!
    
    //text
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var departmentName: UITextField!
    @IBOutlet weak var employeeNumber: UITextField!
    @IBOutlet weak var ticketNumber: UITextField!
    @IBOutlet weak var pcName: UITextField!
    @IBOutlet weak var macAddress: UITextField!
    @IBOutlet weak var deskNumber: UITextField!
    @IBOutlet weak var dueDate: UITextField!
    
    var formName: form!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate     //reference appDelegate to work with CoreData
    
    
    
    
    
    
    
    var forms: [form] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //unselect all the switches
        newHireSwitch.isOn = false
        leaseReturnSwitch.isOn = false
        replaceSwitch.isOn = false
        wipedSwitch.isOn = false
        collectionSwitch.isOn = false
        imagedSwitch.isOn = false
        driversSwitch.isOn = false
        primaryUserSwitch.isOn = false
        softwareSwitch.isOn = false
        
        
        
        //storing core data
        
        saveData()
        
        
        
        
        
        
        
    }//end of view did load
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParent) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
        
    }
    
    @objc func canRotate() -> Void {}           //used in AppDelegate to allow landscape orientation for this view Controller
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }//end of touchesBegan
    
    
    
    @IBAction func createFormButtonPressed(_ sender: Any) {
        
        if((pcName.text?.isEmpty != true)&&(departmentName.text?.isEmpty != true)) {        //pc name and department can't be empty before making the form
            
            
            
            formName = form(newHireSwitch: newHireSwitch, leaseReturnSwitch: leaseReturnSwitch, replaceSwitch: replaceSwitch, wipedSwitch: wipedSwitch, collectionSwitch: collectionSwitch, imagedSwitch: imagedSwitch, driversSwitch: driversSwitch, primaryUserSwitch: primaryUserSwitch, softwareSwitch: softwareSwitch, employeeName: employeeName, departmentName: departmentName, employeeNumber: employeeNumber, ticketNumber: ticketNumber, pcName: pcName, macAddress: macAddress, deskNumber: deskNumber, dueDate: dueDate)
            
            let computerName = formName.pcName.text         //get the computer name
            
            //save the form information:
            
            
            
            
            
            
            
            
            
            performSegue(withIdentifier: "createForm", sender: self)        //segue to view all the forms
            
        }
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let collectionFormView = segue.destination as! CollectionFormViewController     //take view controller and store it in variable
        
        
        
        collectionFormView.formArray.append(formName!.pcName.text!)         //add the computer name to the array
        
        
    }
    
    
    

    func saveData() {
        let context = appDelegate.persistentContainer.viewContext           //allows for interaction with core data
        let newForm = NSEntityDescription.insertNewObject(forEntityName: "Forms", into: context)        //save into context
        
        newForm.setValue("Test", forKey: "pcName")
        newForm.setValue("Test2", forKey: "department")
        
        
        do {
            
            try context.save()          //save the data
            print("works")
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Forms")
            
            request.returnsObjectsAsFaults = false
            
            let results = try context.fetch(request)        //try to get the data
            
            if results.count > 0 {          //check if there are actually any data stored first
                
                for result in results as! [NSManagedObject] {
                    
                    if let pcName = result.value(forKey:"pcName") as? String {
                        
                        print(pcName)
                        
                    }//end of if let
                    if let department = result.value(forKey:"department") as? String {
                        print(department)
                    }
                    
                }
                
            }
            
        }
        catch {
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    

}//end of class
