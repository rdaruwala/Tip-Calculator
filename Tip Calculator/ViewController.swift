//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Rohan Daruwala on 6/29/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tenPercentButton: UIButton!
    
    @IBOutlet var twentyfivePercentButton: UIButton!
    @IBOutlet var twentyPercentButton: UIButton!
    @IBOutlet var fifteenPercentButton: UIButton!
    @IBOutlet var displayAmount: UILabel!
    @IBOutlet var tipObject: UILabel!
    @IBOutlet var GrandTotalObject: UILabel!
    
    @IBOutlet var getMoney: UITextField!
    @IBOutlet var displayPeople: UILabel!
    @IBOutlet var downPeople: UIButton!
    @IBOutlet var upPeople: UIButton!
    var using = 0
    var people = 1.00
    
    /** 
    When submit is pressed, calculate and display the total amounts
    **/
    @IBAction func submitAmount(sender: AnyObject) {
        if(getMoney.text != nil && getMoney.text != ""){
            let totalNoTip:Double = Double(getMoney.text!)!
            let percentTip = Double("0." + String(using))
            let total = totalNoTip + totalNoTip*percentTip!
            let result = total / people
            let formatter = NSNumberFormatter()
            self.view.endEditing(true)
            formatter.numberStyle = .CurrencyStyle
            displayAmount.text = "Cost per Person: " + formatter.stringFromNumber(result)!
            GrandTotalObject.text = "Grand Total: " + formatter.stringFromNumber(total)!
            tipObject.text = "Total Tip: " + formatter.stringFromNumber(totalNoTip*percentTip!)!
            
        }
        
    }
    
    /** 
    Increment up 1 person 
    **/
    @IBAction func upPersonAction(sender: AnyObject) {
        people++
        if(people == 1){
            displayPeople.text = String(String(Int(people)) + " person")
        }
        else{
            displayPeople.text = String(String(Int(people)) + " people")
        }
    }
    
    /** 
    Increment down 1 person 
    **/
    @IBAction func downPersonAction(sender: AnyObject) {
        if(people > 1){
            people--
            if(people == 1){
                displayPeople.text = String(String(Int(people)) + " person")
            }
            else{
                displayPeople.text = String(String(Int(people)) + " people")
            }
        }
    }
    
    /** 
    Select the 10-percent button 
    **/
    @IBAction func tenperAction(sender: AnyObject) {
        let tenper = UIImage(named: "10Selected.png")
        tenPercentButton.setImage(tenper, forState: UIControlState.Normal)
        
        fifteenPercentButton.setImage(UIImage(named: "15Unselected.png"), forState: UIControlState.Normal)
        
        twentyPercentButton.setImage(UIImage(named: "20Unselected.png"), forState: UIControlState.Normal)
        
        twentyfivePercentButton.setImage(UIImage(named: "25Unselected.png"), forState: UIControlState.Normal)
        
        using = 10
    }
    
    /** 
    Select the 15-percent button 
    **/
    @IBAction func fifteenperAction(sender: AnyObject) {
        let fifteenper = UIImage(named: "15Selected.png")
        fifteenPercentButton.setImage(fifteenper, forState: UIControlState.Normal)
        
        tenPercentButton.setImage(UIImage(named: "10Unselected.png"),forState: UIControlState.Normal)
        
        twentyPercentButton.setImage(UIImage(named: "20Unselected.png"), forState: UIControlState.Normal)
        
        twentyfivePercentButton.setImage(UIImage(named: "25Unselected.png"), forState: UIControlState.Normal)
        
        using = 15
        
    }
    
    /** 
    Select the 20-percent button 
    **/
    @IBAction func twentyPerAction(sender: AnyObject) {
        let twentyper = UIImage(named: "20Selected.png")
        twentyPercentButton.setImage(twentyper, forState: UIControlState.Normal)
        
        tenPercentButton.setImage(UIImage(named: "10Unselected.png"),forState: UIControlState.Normal)
        
        fifteenPercentButton.setImage(UIImage(named: "15Unselected.png"), forState: UIControlState.Normal)
        
        twentyfivePercentButton.setImage(UIImage(named: "25Unselected.png"), forState: UIControlState.Normal)
        
        using = 20
    }
    
    /** 
    Select the 25-percent button 
    **/
    @IBAction func twentyfivePerAction(sender: AnyObject) {
        let twentyfiveper = UIImage(named: "25Selected.png")
        twentyfivePercentButton.setImage(twentyfiveper, forState: UIControlState.Normal)
        
        tenPercentButton.setImage(UIImage(named: "10Unselected.png"),forState: UIControlState.Normal)
        
        fifteenPercentButton.setImage(UIImage(named: "15Unselected.png"), forState: UIControlState.Normal)
        
        twentyPercentButton.setImage(UIImage(named: "20Unselected.png"), forState: UIControlState.Normal)
        
        using = 25
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.png")!)
        let tenper = UIImage(named: "10Unselected.png")
        let fifteenper = UIImage(named: "15Unselected.png")
        let twentyper = UIImage(named: "20Unselected.png")
        let twentyfiveper = UIImage(named: "25Unselected.png")
        
        tenPercentButton.setImage(tenper, forState: UIControlState.Normal)
        fifteenPercentButton.setImage(fifteenper, forState: UIControlState.Normal)
        twentyPercentButton.setImage(twentyper, forState: UIControlState.Normal)
        twentyfivePercentButton.setImage(twentyfiveper, forState: UIControlState.Normal)
        
        upPeople.setImage(UIImage(named: "upArrow.png"), forState: UIControlState.Normal)
        downPeople.setImage(UIImage(named: "downArrow.png"), forState: UIControlState.Normal)
        
        displayPeople.text = String(String(Int(people)) + " person")
        
        fifteenperAction(self)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    /** 
    Moves the screen when keyboard is opened and closed 
    **/
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 200
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 200
    }
    
    
    
    
}

