

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert String to Decimal")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }

    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        if let calcValue = sender.currentTitle {
            
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: calcValue) {
                displayValue = result
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton){
        
        if let numValue = sender.currentTitle {
            if isFinishedTyping {

                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." && displayLabel.text!.contains("."){
                    return
                }
                displayLabel.text!.append(numValue)

             
            }
            
        }
    
    }

}

