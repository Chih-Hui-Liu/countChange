//
//  ViewController.swift
//  countChange
//
//  Created by Leo on 2020/12/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var payTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var people: UITextField!
    
    var pay :Double = 0
    var tip :Double = 0
    var peopleShare:Double = 1
    var moneyArray = [1000, 500, 200, 100, 50, 10, 5, 1]
    var newTotalPay = 0.0
    var newSharePay = 0.0
    var zeroString = ""
    var oneString = ""
    @IBOutlet weak var changeSegment: UISegmentedControl!
    @IBOutlet weak var needCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func calculatorButton(_ sender: UIButton) {
        pay = Double(payTextField.text ?? "0")!
        tip = Double(tipTextField.text ?? "0")!
        peopleShare = Double(people.text ?? "1")!
        newTotalPay = pay - (pay * tip)/100
        newSharePay = (pay - (pay * tip)/100)/peopleShare //直接在button 內計算 並且放置在新的變數上
        
        totalLabel.text = String(newTotalPay)
        tipLabel.text = String(pay * tip/100)
        shareLabel.text = String(lround(newSharePay))
        zeroString = total()
        oneString = person()
        if changeSegment.selectedSegmentIndex == 0{
            needCount.text  = zeroString
        }else if changeSegment.selectedSegmentIndex == 1{
            needCount.text  = oneString
        }
    
        view.endEditing(true) //結束鍵盤
    }
    
    @IBAction func change(_ sender: UISegmentedControl) {
       if sender.selectedSegmentIndex == 0 {
        needCount.text  = zeroString
       }else if sender.selectedSegmentIndex == 1 {
        needCount.text  = oneString
       }
        //切換顯示換多少錢
    }
        func person() -> String{
            var string = ""
            for i in 0...moneyArray.count-1 {
            let answer = Int(newSharePay).quotientAndRemainder(dividingBy: moneyArray[i])//quotientAndRemainder用來存放商數以及餘數
                string += "\(moneyArray[i])元 * \(answer.quotient)， "
                
                newSharePay = Double(answer.remainder)//用moneyArray[i]的餘數重新當新的newSharePay
            }
             return string
        }
        func total()-> String{
            var string = ""
            for i in 0...moneyArray.count-1 {
            let answer = Int(newTotalPay).quotientAndRemainder(dividingBy: moneyArray[i])
                string += "\(moneyArray[i])元 * \(answer.quotient)， "
                newTotalPay = Double(answer.remainder)
            }
            return string
        }
    }
  
   
    
    
    
    


