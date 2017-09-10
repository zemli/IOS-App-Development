//
//  TipsCalculatorModel.swift
//  Demo
//
//  Created by lizeming on 2017-09-08.
//  Copyright © 2017 lizeming. All rights reserved.
//

import Foundation

class TipCalculatorModel{
    var total: Double
    var taxPct: Double
    var subTotal: Double{ //把subtotal变为一个computed property
        get{
            return total/(taxPct + 1) //它没有实际的储存值,每次都是根据其他值计算出来的
        }
        set(newSubTotal){
            //setter方法将会更新它的备份属性(i.e. 根据newSubtotal设置total和taxPct，但是这对app是没有意义）
        }
    }
    
    init(total:Double, taxPct:Double) {
        self.total = total //通过使用self前缀来区分出两者的不同
        self.taxPct = taxPct
    }
    
    func calcTip(tipPct: Double) -> Double {
        return tipPct * subTotal;
    }

    func getPossibleTips() -> Dictionary<Int, Double> {
        let possibleTipsInferred = [0.15, 0.18, 0.20] //数组隐式声明类型
        
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            
            retval[intPct] = calcTip(tipPct: possibleTip)
        }
        return retval
    }
    
}


