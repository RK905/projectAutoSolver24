//
//  ViewController.swift
//  projectAutoSolver24
//
//  Created by x on 4/27/16.
//  Copyright © 2016 TeamAutoSolver24. All rights reserved.
//

extension String {
    
    func containsValidCharacters() -> Bool {
        
        var charSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        charSet = charSet.invertedSet
        
        let range = (self as NSString).rangeOfCharacterFromSet(charSet)
        
        if range.location != NSNotFound {
            return false
        }
        
        return true
    }
}

import UIKit

class start: UIViewController {
    
    @IBOutlet var firstNumber: UITextField!
    @IBOutlet var secondNumber: UITextField!
    @IBOutlet var thirdNumber: UITextField!
    @IBOutlet var fourthNumber: UITextField!
    
    var numberFirst = [String]()
    var numberSecond = [String]()
    var numberThird = [String]()
    var numberFourth = [String]()
    var numberFifth = [String]()
    var numberSixth = [String]()
    
    var operationFirst = [String]()
    var operationSecond = [String]()
    var operationThird = [String]()

    override func viewDidLoad() {
        print("Start - Home")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func solveButton(sender: AnyObject) {
        print("User pressed solve button")
        checkNumberTF()
    }
    
    @IBAction func clearNumbersButton(sender: AnyObject) {
        print("User pressed clear numbers button")
        clearNumbers()
    }
    
    func clearNumbers(){
        print("All numbers are cleared")
        firstNumber.text = ""
        secondNumber.text = ""
        thirdNumber.text = ""
        fourthNumber.text = ""
    }
    
    func checkNumberTF(){
        var somethingWrong = false
        var alertTitle = ""
        var alertMessage = ""
        
        if(firstNumber.text?.isEmpty == true){
            print("First Number is empty")
            somethingWrong = true
            alertTitle = "First Number"
            alertMessage = "First Number is empty"
        }
        else if(secondNumber.text?.isEmpty == true){
            print("Second Number is empty")
            somethingWrong = true
            alertTitle = "Second Number"
            alertMessage = "Second Number is empty"
        }
        else if(thirdNumber.text?.isEmpty == true){
            print("Third Number is empty")
            somethingWrong = true
            alertTitle = "Third Number"
            alertMessage = "Third Number is empty"
        }
        else if(fourthNumber.text?.isEmpty == true){
            print("Fourth Number is empty")
            somethingWrong = true
            alertTitle = "Fourth Number"
            alertMessage = "Fourth Number is empty"
        }
        else if(firstNumber.text?.containsValidCharacters() == true){
            print("First Number is not a number")
            somethingWrong = true
            alertTitle = "First Number"
            alertMessage = "First Number is not a number"
        }
        else if(secondNumber.text?.containsValidCharacters() == true){
            print("Second Number is not a number")
            somethingWrong = true
            alertTitle = "Second Number"
            alertMessage = "Second Number is not a number"
        }
        else if(thirdNumber.text?.containsValidCharacters() == true){
            print("Third Number is not a number")
            somethingWrong = true
            alertTitle = "Third Number"
            alertMessage = "Third Number is not a number"
        }
        else if(fourthNumber.text?.containsValidCharacters() == true){
            print("Fourth Number is not a number")
            somethingWrong = true
            alertTitle = "Fourth Number"
            alertMessage = "Fourth Number is not a number"
        }
        
        if(somethingWrong == true){
            print("Something is wrong with the number textfields")
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if(somethingWrong == false){
            print("Nothing is wrong with the number textfields, going to check if there are solutions")
            solutions()
        }
    }
    
    func solutions(){
        //Finding solutions of the numbers inputted by the user
        print("Finding Solutions")
        
        if (numberFirst.isEmpty == false){
            print("Solutions found, Going to solutionsCV")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("solutionsCV") as! solutionsCV
            vc.numberFirstPass = numberFirst
            vc.numberSecondPass = numberSecond
            vc.numberThirdPass = numberThird
            vc.numberFourthPass = numberFourth
            vc.numberFifthPass = numberFifth
            vc.numberSixthPass = numberSixth
            vc.operationFirstPass = operationFirst
            vc.operationSecondPass = operationSecond
            vc.operationThirdPass = operationThird
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if (numberFirst.isEmpty == true){
            print("There are no Solutions")
            let noSolutionsAlert = UIAlertController(title: "No Solutions", message: "There are no solutions for the numbers you have inputted", preferredStyle: .Alert)
            noSolutionsAlert.addAction(UIAlertAction(title: "OK", style: .Default , handler: nil))
            self.presentViewController(noSolutionsAlert, animated: true, completion: nil)
        }
        
    }
    
}

