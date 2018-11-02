//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


//
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

print("RayElectronics Inc 💻! Please enter prefered type of calculator |Regular or High order?|")

let userChoice = readLine()

if var userChoiceOfFunction = userChoice {

switch userChoice {
case "Regular":
    
    print(" Please enter your operation")
    
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
                            print("\(myFirstInput) ? \(mySecondInput) = \(result)")
                            
                        }
                        print("Now guess the random operator")
                        let userOperatorInput = readLine()
                        if let myUserOperatorInput = userOperatorInput {
                            guard arrayOfOperators.contains(myUserOperatorInput)  /*.count == 1 && myUserOperatorInput == ""*/ else {
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
                    print("\(myFirstInput) \(operatoraInput) \(mySecondInput) = \(closureReturns)")
                    
                }
            }
}
}
    
    
case: "High order"

print("we have high order functions like filter, map and reduce. Please enter your prefered choice")
let userInputt = readLine()

if let myUserChoiceOfOperation = userInputt {
    let theComponents = myUserChoiceOfOperation.components(separatedBy: " ")
    
    var highOrderFunction = theComponents[0]
    var unfilteredArray = theComponents[1]
    var filterBy = theComponents[3]
    var numFilteredBy = Int(theComponents[4])
    let myUnwrappedFilteredBy = numFilteredBy ?? 0
    
    switch filterBy {
    case "<":
        
        func filter(inputArray:[Int], filter: (Int) -> Bool) -> [Int] {
            var filteredNumbers:[Int] = []
            for myNumber in inputArray {
                if myNumber < myUnwrappedFilteredBy {
                    filteredNumbers.append(myNumber)
                }
            }
            return filteredNumbers
            
        }
        
    case ">":
        func filter(inputArray:[Int], filter: (Int) -> Bool) -> [Int] {
            var filteredNumbers:[Int] = []
            for myNumber in inputArray {
                if myNumber > myUnwrappedFilteredBy {
                    filteredNumbers.append(myNumber)
                }
            }
            return filteredNumbers
            
        }
    default:
        print("invalid input")
    }
    }
    }
    
    
    
    func map(inputArray:[Int]) -> [Int]{
        var numbersInArray:[Int] = []
        for number in inputArray {
            numbersInArray += number * userInputtt
            return numbersInArray
        }
        
    }
    
    
    func map(inputArray:[Int]) -> [Int]{
        var numbersInArray:[Int] = []
        for number in inputArray {
            numbersInArray += number / userInputtt
            return numbersInArray
        }
        

    
default:
print("Return to menu")
    
}
  
}



