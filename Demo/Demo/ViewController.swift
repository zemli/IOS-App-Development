//
//  ViewController.swift
//  Demo
//
//  Created by lizeming on 2017-09-07.
//  Copyright © 2017 lizeming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func calculateTapped(sender: AnyObject){
        
        // 1
        //tipCalc.total = Double(totalTextField.text!)!
        // 2
        let possibleTips = tipCalc.getPossibleTips()
        var results = ""
        // 3
        for (tipPct, tipValue) in possibleTips {
            // 4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        // 5
        textView.text = results
 
    }
    @IBAction func taxPercentageChanged(sender: AnyObject){
        tipCalc.taxPct = Double(taxSlider.value) / 100.0
        
        refreshUI()
    }
    @IBAction func viewTapped(sender: AnyObject){
        totalTextField.resignFirstResponder() //文本框退出键盘
        textView.resignFirstResponder() //文本框退出键盘
    }
    
    //为模板类添加一个属性和一个刷新UI的方法
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
        // 1
        totalTextField.text = String(tipCalc.total)
        
        // 2
        taxSlider.value = Float(tipCalc.taxPct) * 100.0
        
        // 3
        taxLabel.text = "Tax Percentage (\(Int(taxSlider.value))%)"
        
        // 4
        textView.text = ""
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


