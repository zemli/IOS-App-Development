//: Playground - noun: a place where people can play

import UIKit

//===============Basic================
var str = "Hello, playground"
let tutorialTeam = 20
let editorTeam = 5
var letter = "a"
let sum = editorTeam + tutorialTeam

//if-else statement
let trunipsAreDelicious = false
if trunipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, trunips are horrible")
}

//===============Class (Tips Calculator) =================
//create a class
class TipCalculator{
    let total: Double
    let taxPct: Double
    let subTotal: Double
    
    init(total:Double, taxPct:Double) {
        self.total = total //通过使用self前缀来区分出两者的不同
        self.taxPct = taxPct
        subTotal = total / (taxPct + 1) //subtotal属性没有命名冲突，你不需要在前面加上self关键词
    }
    
    func calcTip(tipPct: Double) -> Double {
        return tipPct * subTotal;
    }
    /*
    func printTips() {
        print("15%: \(calcTip(tipPct: 0.15))")
        print("18%: \(calcTip(tipPct: 0.18))")
        print("20%: \(calcTip(tipPct: 0.20))")
    }
    */
    func getPossibleTips() -> Dictionary<Int, Double> {
        let possibleTipsInferred = [0.15, 0.18, 0.20] //数组隐式声明类型
        //let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20] //数组显示声明类型 note: [Double]
        
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            
            retval[intPct] = calcTip(tipPct: possibleTip)
            //print("\(possibleTip*100)%: \(tipCalc.calcTip(tipPct: possibleTip))")
        }
        return retval
    }

}

let tipCalc = TipCalculator(total: 33.75, taxPct: 0.13)
//tipCalc.printTips() changed by getPossibleTips()
tipCalc.getPossibleTips()








