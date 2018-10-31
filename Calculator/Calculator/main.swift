//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

print("Enter some numbers")
while true  {
    
    let userInput = readLine()
    
    if let myUserInput = userInput {
        
        let componentUserInput = myUserInput.components(separatedBy: " ")
        guard componentUserInput.count == 3 else {
            print("Invalid input format. Input values with space")
            continue
        }
        
        let firstInput = componentUserInput[0]
        let operatoraInput = componentUserInput[1]
        let secondInput = componentUserInput[2]
        if let myFirstInput = Double(firstInput){
            
            if let mySecondInput = Double(secondInput){
                
        
        if operatoraInput == "?" {
            var computerRandomOperator = ""
            let arrayOfOperators = ["+", "-", "*", "/"]
            if let randomOperator = arrayOfOperators.randomElement(){
                computerRandomOperator = randomOperator
                let myNewClosure = mathStuffFactory(opString: computerRandomOperator)
                let result = myNewClosure(myFirstInput,mySecondInput)
                print(" The outcome of \(myFirstInput) ? \(mySecondInput) is = \(result)")
                
            }
            print("Now guess the random operator")
           let userOperatorInput = readLine()
            if let myUserOperatorInput = userOperatorInput {
guard myUserOperatorInput.count == 1 && myUserOperatorInput == "" else {
                    print("Please you can only input an operators like +, -, *, / ")
                    continue
                }

if myUserOperatorInput == computerRandomOperator {
                    print("You got it right")
                } else {
                    if myUserOperatorInput != computerRandomOperator {
                    print("You input operator is wrong. The right operator is \(computerRandomOperator)")
                    }
                }

            continue
        }
        
            }
                
    let closure = mathStuffFactory(opString: operatoraInput)
                let closureReturns = closure(myFirstInput, mySecondInput)
                print("The result of \(myFirstInput) \(operatoraInput) \(mySecondInput) is \(closureReturns)")
                
        }
    }
//
//            print("Check your input spaces")
    
}



}
