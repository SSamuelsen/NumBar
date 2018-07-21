//
//  CollectionFormViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/18/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class CollectionFormViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!        //outlet for our collectionView
    
    var formArray:[String] = ["item1","item2","item3","item4","item5","item6","item7","item8"]  //just the test array for the collection view
    
    var isClicked: Bool!
    
    
    
    
    //var formArray:[String] = []         //stores the forms
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        UIView.animate(withDuration: 0.5, animations: {
                    
            let w = UIScreen.main.bounds.width
            let h = UIScreen.main.bounds.height
                    
            let label = UILabel(frame: CGRect(x: w / 2, y: h / 2, width: 120, height: 30))
            
            label.text = String(indexPath.item)     //get the cell position number 
            
            label.center = CGPoint(x: w / 2, y: h / 2)
            label.textAlignment = .center
            label.textColor = UIColor.white
            self.view?.addSubview(label)
                    
                    
            })

        
        
    }//end of func
    
    

    
    
    
    
    
    
    
    
    

}//end of class


extension CollectionFormViewController: UICollectionViewDataSource {            //extension of CollectionFormViewController //conform to the data source protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return formArray.count      //number of forms saved
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "formCell", for: indexPath) as! formCell         //cast as the file we made to customize the images
        
        let label = formArray[indexPath.item]
        cell.formLabel.text = label         //set the cell equal to the item in the array
        
        return cell
    }
    
}//end of extension


extension CollectionFormViewController: UICollectionViewDelegateFlowLayout {        //conform to the delegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            
        let columnsNumber:CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets:CGFloat = 10
        let cellSpace: CGFloat = 5
        
            
        return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
    }
    
}//end of extension




