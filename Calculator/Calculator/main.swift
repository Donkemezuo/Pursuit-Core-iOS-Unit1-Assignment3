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


while true {
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
                        break
                    }
                }
            }
        }
        
        
    case "High order":
        
        print("we have high order functions like filter, map and reduce. Please enter your prefered choice")
        let userInputt = readLine()
        
        if let myUserChoiceOfOperation = userInputt {
            let theComponents = myUserChoiceOfOperation.components(separatedBy: " ")
            
            var highOrderFunction = theComponents[0]
            var unfilteredArray = theComponents[1]

            let componentsOfUnfilteredArray = unfilteredArray.components(separatedBy:"," ).compactMap {Int($0)}
            var ByOperator = theComponents[3]
            var numFilteredBy = Int(theComponents[4])
            let userInputBynumber = numFilteredBy ?? 0
            

            
            switch highOrderFunction {
            case "filter":
            switch ByOperator {
            case "<":
                func filter(inputArray:[Int], filterClosure: (Int) -> Bool) -> [Int] {
                    var filteredNumbers:[Int] = []
                    for myNumber in inputArray {
                        if filterClosure(myNumber) {
                            filteredNumbers.append(myNumber)
                        }
                    }
                    return filteredNumbers
                    
                }
                print(filter(inputArray: componentsOfUnfilteredArray, filterClosure: { (myNumber) -> Bool in
                    return myNumber < userInputBynumber
                }))
                
            case ">":
                func filter(inputArray:[Int], filterClosure: (Int) -> Bool) -> [Int] {
                    var filteredNumbers:[Int] = []
                    for myNumber in inputArray {
                    if filterClosure(myNumber) {
                        filteredNumbers.append(myNumber)
                    }
                }
                return filteredNumbers
            }
          
            print(filter(inputArray: componentsOfUnfilteredArray, filterClosure: { (myNumber) -> Bool in
                return myNumber > userInputBynumber
            }))
            
            default:
                print("invalid input")
                }
         case "map":
        switch ByOperator {
            case "*":
            func map(inputArray:[Int], mapClosure:(Int) -> Int) -> [Int] {
                var numbersInArray:[Int] = []
                for number in inputArray {
                    let intInmap = mapClosure(number)
                    numbersInArray.append(intInmap)
            
                }
                return numbersInArray
                }
            print(map(inputArray: componentsOfUnfilteredArray, mapClosure: { (myNumber) -> Int in
                return myNumber * userInputBynumber
                }))
            
        case "/":
            func map(inputArray:[Int], mapClosure:(Int) -> Int) -> [Int] {
                var numbersInArray:[Int] = []
                for number in inputArray {
                    let intInmap = mapClosure(number)
                    numbersInArray.append(intInmap)
                    
                }
                return numbersInArray
            }
            print(map(inputArray: componentsOfUnfilteredArray, mapClosure:{ (myNumber) -> Int in
                return myNumber / userInputBynumber
            
            }))
            
    default:
    print("Map high order function only takes in (*,/) operators ")
                
        }
            case "reduce":
    switch ByOperator{
        
    case "+":
        func reduce(inputArray:[Int], reduceClosure:(Int,Int) -> Int, startValue: Int) -> Int {
            var total = startValue
            for myNumber in inputArray {
                total = reduceClosure(total,myNumber)
            }
            return total
        }
        print(reduce(inputArray: componentsOfUnfilteredArray, reduceClosure: { (total, myNumber) -> Int in
            return  total + myNumber
        }, startValue: userInputBynumber))
        
    case "*":
        
        func reduce(inputArray:[Int], reduceClosure:(Int,Int) -> Int, startValue: Int) -> Int {
            var total = startValue
            for myNumber in inputArray {
                total = reduceClosure(total,myNumber)
            }
            return total
        }
        print(reduce(inputArray: componentsOfUnfilteredArray, reduceClosure: { (total, myNumber) -> Int in
            return  total *  myNumber
        }, startValue: userInputBynumber))
        
    default:
                print("reduce operator only take in * and + in this program")
            }
        
            default:
                print("invalid input")
            }
        }
    
    default:
        print("Return to menu")

            }
    

}

}

