//
//  ViewController.swift
//  SimpleCalciOS
//
//  Created by Sarthak Turkhia on 10/17/18.
//  Copyright © 2018 Sarthak Turkhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calcLabel: UILabel!
    var currentFunction : String = ""
    var operation:[String] = []
    var history:[String] = []
    var currentHist: String = ""
    
    @IBAction func clear(_ sender: Any) {
        self.calcLabel.text = nil
        currentFunction = ""
        operation = []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : HistoryViewController = segue.destination as! HistoryViewController
        destVC.history = history
    }
    
    @IBAction func Digit(_ sender: UIButton) {
        if calcLabel.text == nil{
            calcLabel.text = String(sender.tag)
        }
        else{
            calcLabel.text = calcLabel.text! + String(sender.tag)
        }
    }
    @IBAction func math(_ sender: UIButton!) {
        if calcLabel.text != nil{
            operation.append(calcLabel.text!)
            let pressed: String = sender!.titleLabel!.text!
            currentFunction = pressed
            self.calcLabel.text = nil
        }
        
    }
    
    @IBAction func history(_ sender: Any) {
        performSegue( withIdentifier: "historySegue", sender: self)
        
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        var result: Int = 0
        if calcLabel.text != nil{
            operation.append(calcLabel.text!)
        }
            if currentFunction == "+"{
                result = Int(operation[0])! + Int(operation[1])!
                currentHist = operation[0] + "+" + operation[1] + "=" + String(result)
            }
            else if currentFunction == "-"{
                result = Int(operation[0])! - Int(operation[1])!
                currentHist = operation[0] + "-" + operation[1] + "=" + String(result)
            }
            else if currentFunction == "*"{
                result = Int(operation[0])! * Int(operation[1])!
                currentHist = operation[0] + "*" + operation[1] + "=" + String(result)
            }
            else if currentFunction == "/"{
                result = Int(operation[0])! / Int(operation[1])!
                currentHist = operation[0] + "/" + operation[1] + "=" + String(result)
            }
            else if currentFunction == "%"{
                result = Int(operation[0])! % Int(operation[1])!
                currentHist = operation[0] + "%" + operation[1] + "=" + String(result)
            }
            self.calcLabel.text = String(result)
            if currentFunction == "Avg"{
                var sum: Int = 0
                let count: Int = operation.count
                for i in operation{
                    sum += Int(i)!
                    currentHist += i + " "
                }
                result = (sum/count)
                currentHist += "Avg = " + String(result)
                self.calcLabel.text = String(result)

            }
            else if currentFunction == "Count"{
                result = operation.count
                for i in operation{
                    currentHist += i + " "
                }
                currentHist += "Count = " + String(result)
                self.calcLabel.text = String(result)
            }

            else if currentFunction == "Fact" {
                if operation.count != 1{
                    calcLabel.text = "illegal input: Try again with one number"
                }
                else{
                    let num: Int = Int(operation[0])!
                    if num < 3{
                        result = num
                    }
                    else{
                        result = factorial(num)
                    }
                    currentHist = String(num) + " Fact = " + String(result)
                    self.calcLabel.text = String(result)
                }
            }
        history.append(currentHist)
        currentHist = ""
        operation = []
    }
    
    public func factorial(_ args: Int) -> Int {
        var result = args
        for i in 1..<args {
            result = result * (args - i)
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
   
    

}

