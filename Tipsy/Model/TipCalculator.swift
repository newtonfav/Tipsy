import UIKit

struct TipCalculator {
    var tipAmount = 0.1
    var splitNumber = 2.0
    var billForEachPerson = 0.0
    
    let tips:[String: Double] = ["0%": 0, "10%": 0.1, "20%": 0.2]
    
    
    mutating func calculateTipForEachPerson(_ billAmount: Double) {
        billForEachPerson = (billAmount + (billAmount * tipAmount)) / splitNumber
    }
    
    func getBillPerPerson() -> String {
        return String(format: "%.2f", billForEachPerson)
    }
    
    func getTipPercent() -> String {
        return String(format: "%.0f", (tipAmount * 100))
    }
    
}
