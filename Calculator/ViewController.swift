//
//  ViewController.swift
//  Swift Sample
//
//  Created by Onur ŞİMŞEK on 22/04/15.
//  Copyright (c) 2015 Onur ŞİMŞEK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var dotAvailable: Bool = true
    var value: Double = 0
    var operandQueue = [Double]()
    var operatorQueue = [String]()
    
    @IBAction func calculatorItems(sender: UIButton) {
        
        if sender.currentTitle == "C" {
            
            display.text = "0"
            operandQueue = [Double]()
            operatorQueue = [String]()
            dotAvailable = true
        
        } else if sender.currentTitle == "+/-"{
            
            if display.text != "0" {
            
                display.text = String(stringInterpolationSegment: (display.text! as NSString).doubleValue * -1)
            
            }
            
        } else if sender.currentTitle == "%" {
            
            display.text = String(stringInterpolationSegment: (display.text! as NSString).doubleValue / 100)
            
        } else if sender.currentTitle == "0" || sender.currentTitle == "000" {
            
            if display.text == "0" {
                display.text = "0"
            }
            else{
                display.text! += sender.currentTitle!
            }
            
        } else if sender.currentTitle == "," {
            
            if dotAvailable != false {
                display.text! += "."
                dotAvailable = false
            }
            
        } else if sender.currentTitle == "+"{
            
            operandQueue.append((display.text! as NSString).doubleValue)
            operatorQueue.append("+")
            dotAvailable = true
            display.text = "0";
            
        } else if sender.currentTitle == "-"{
            
            operandQueue.append((display.text! as NSString).doubleValue)
            operatorQueue.append("-")
            dotAvailable = true
            display.text = "0";
            
        } else if sender.currentTitle == "x"{
            
            operandQueue.append((display.text! as NSString).doubleValue)
            operatorQueue.append("x")
            dotAvailable = true
            display.text = "0";
            
        } else if sender.currentTitle == "/"{
            
            operandQueue.append((display.text! as NSString).doubleValue)
            operatorQueue.append("/")
            dotAvailable = true
            display.text = "0";
            
        } else{
            
            var number = sender.currentTitle!
            if display.text == "0" {
                display.text = number
            }else{
                display.text! += number
            }
            println("Digit is \(number)")
            
        }
        println("operandQueue = \(operandQueue)")
        println("operatorQueue = \(operatorQueue)")
        
    }
    
    
    @IBAction func calculate() {
        
        if operandQueue.count >= 1 && display.text != "0" {
            operandQueue.append((display.text! as NSString).doubleValue)
            dotAvailable = true
            println("operandQueue = \(operandQueue)")
            println("operatorQueue = \(operatorQueue)")
        }
        
        for var i = 0; i < operatorQueue.count; i++ {
            switch operatorQueue[i]{
                case "+":
                    value = operandQueue.removeAtIndex(0)
                    operandQueue[0] += value;
                case "-":
                    value = operandQueue.removeAtIndex(0)
                    value -= operandQueue[0]
                    operandQueue[0] = value
                case "x":
                    value = operandQueue.removeAtIndex(0)
                    operandQueue[0] *= value;
                case "/":
                    value = operandQueue.removeAtIndex(0)
                    value /= operandQueue[0]
                    operandQueue[0] = value
            default: break
            }
        }
        
        display.text = String(stringInterpolationSegment: operandQueue[0])
        operatorQueue = [String]()
        operandQueue = [Double]()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

