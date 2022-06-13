

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ value: Double) {
        self.number = value
    }
    
    
    private var intermediateCalculations: (input: Double, operator: String)?
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performTwoNumberCalculations(n2: n)
            default:
                intermediateCalculations = (input: n, operator: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculations(n2: Double)-> Double? {
        if let n1 = intermediateCalculations?.input,
            let operation = intermediateCalculations?.operator {
    
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
