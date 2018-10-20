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
    
    @IBAction func clear(_ sender: Any) {
        self.calcLabel.text = nil
        currentFunction = ""
        operation = []
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
    
    @IBAction func calculate(_ sender: UIButton) {
        var result: Int = 0
        if calcLabel.text != nil{
            operation.append(calcLabel.text!)
        }
            if currentFunction == "+"{
                result = Int(operation[0])! + Int(operation[1])!
            }
            else if currentFunction == "-"{
                result = Int(operation[0])! - Int(operation[1])!
            }
            else if currentFunction == "*"{
                result = Int(operation[0])! * Int(operation[1])!
            }
            else if currentFunction == "/"{
                result = Int(operation[0])! / Int(operation[1])!
            }
            else if currentFunction == "%"{
                result = Int(operation[0])! % Int(operation[1])!
            }
            self.calcLabel.text = String(result)
            if currentFunction == "Avg"{
                var sum: Int = 0
                let count: Int = operation.count
                for i in operation{
                    sum += Int(i)!
                }
                result = (sum/count)
                self.calcLabel.text = String(result)

            }
            else if currentFunction == "Count"{
                result = operation.count
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
                    self.calcLabel.text = String(result)
                }
            }
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

