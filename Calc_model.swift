//
//  Calc_model.swift
//  CalCuator
//
//  Created by Kairui Hu on 4/11/23.
//

import Foundation

class Calc_model
{
    
    //var formula: String
    //var lastop: String
    
    init ()
    {
        //formula = ""
        //lastop = ""
    }
    
    func btnNumberClick(val: String, str: String) -> String
    {
        let value = val
        var strOut = str
        
        if strOut == "0"
        {
            strOut = ""
        }
        if value == "."{
            for char in strOut{
                if char == "." { return strOut}
            }
        }
        strOut += value
        return strOut
    }
    
    func btnClearClick(str : String) -> String
    {
        var StrOut = str
        StrOut = "0"
        return StrOut
    }
    
    func btnSignClick(str: String) -> String
    {
        var strOut = str
        if strOut == "0"
        {
            return "0"
        }
        if strOut.first == "!"
        {
            strOut.removeFirst()
            return(strOut)
        }
        else
        {
            strOut = "!" + strOut
            return(strOut)
        }
    }
    func btnmodSign(str: String) -> String
    {
        var strOut = str
        guard var value = Double(strOut)else{return strOut}
        value = value/100
        strOut = String(value)
        return strOut
    }
    
    func dividetap(str: String, lastOp :String, Formula :String) -> (str: String, lastOp: String, Formula: String)
    {
        var strout = str
        var formula = Formula
        var lastop = lastOp
        print(strout, "strOut", lastOp,"lastOp", Formula, "Formula")
        if lastOp == "/" && strout == "0"
        {
            strout = "error"
            return (strout, lastOp, Formula)
        }
        
        else{
            if (strout == "")
            {
                formula = String(formula.dropLast())
                formula = formula + "/"
            }
            else{
                formula = formula + strout + "/"
            }
            lastop = "/"
            return (strout, lastop, formula)
        }
    }
    
    func multiplytap(str: String, lastOp :String, Formula :String) -> (str: String, lastOp: String, Formula: String)
    {
        var strout = str
        var formula = Formula
        var lastop = lastOp
        print(strout, "strOut", lastOp,"lastOp", Formula, "Formula")
        if lastOp == "/" && strout == "0"
        {
            strout = "error"
            return (strout, lastOp, Formula)
        }
        
        else{
            if (strout == "")
            {
                formula = String(formula.dropLast())
                formula = formula + "*"
            }
            else{
                formula = formula + strout + "*"
            }
            lastop = "*"
            return (strout, lastop, formula)
        }
    }
    
    func addtap(str: String, lastOp :String, Formula :String) -> (str: String, lastOp: String, Formula: String)
    {
        var strout = str
        var formula = Formula
        var lastop = lastOp
        print(strout, "strOut", lastOp,"lastOp", Formula, "Formula")
        if lastOp == "/" && strout == "0"
        {
            strout = "error"
            return (strout, lastOp, Formula)
        }
        
        else{
            if (strout == "")
            {
                formula = String(formula.dropLast())
                formula = formula + "+"
            }
            else{
                formula = formula + strout + "+"
            }
            lastop = "+"
            return (strout, lastop, formula)
        }
    }
    
    func subtracttap(str: String, lastOp :String, Formula :String) -> (str: String, lastOp: String, Formula: String)
    {
        var strout = str
        var formula = Formula
        var lastop = lastOp
        print(strout, "strOut", lastOp,"lastOp", Formula, "Formula")
        if lastOp == "/" && strout == "0"
        {
            strout = "error"
            return (strout, lastOp, Formula)
        }
        
        else{
            if (strout == "")
            {
                formula = String(formula.dropLast())
                formula = formula + "-"
            }
            else{
                formula = formula + strout + "-"
            }
            lastop = "-"
            return (strout, lastop, formula)
        }
    }
    
    func equaltap(str: String, lastOp :String, Formula :String) -> (str: String, lastOp: String, Formula: String)
    {
        var strOut = str
        var formula = Formula
        var lastop = lastOp
        
        formula += strOut
        var numbers: [Double] = []
        var operators: [Character] = []
        var currentNumber = ""
        if (strOut == "")
        {
            print("invalid")
        }
        if(strOut == "0" && lastop == "/")
        {
            print("invalid")
        }
        else{
            
            for character in formula {
                if let number = Double(String(character)) {
                    currentNumber.append(character)
                }
                else if(character == "!")
                {
                    currentNumber.append("-")
                }
                else if(character == ".")
                {
                    currentNumber.append(character)
                }

                else {
                    if !currentNumber.isEmpty {
                        numbers.append(Double(currentNumber)!)
                        currentNumber = ""
                    }
                    operators.append(character)
                }
            }

            if !currentNumber.isEmpty {
                numbers.append(Double(currentNumber)!)
            }
            }
        
        print(numbers) // prints [123, 234, 876, 333, 777]
        print(operators) // prints ["*", "/", "+", "-"]
        var count = 0
        var count3 = 0
        var new_num: Double = 0
        var charToCount : Character = "*"
        var count2 = operators.filter { $0 == charToCount }.count
        while (count2 != 0)
        {
            print(operators)
            print(numbers)
            count = 0
            count3 = 0
            for i in operators
            {
                if  (i == "*" && count3 < 1)
                {
                    print(i)
                    new_num = numbers[count] * numbers[count + 1]
                    operators.remove(at:count)
                    numbers.replaceSubrange(count...count+1, with: [new_num])
                    print(numbers)
                    count2 -= 1
                    count3 += 1 // did once, stop
                }
                count += 1
            }
        }
        
        
        
        charToCount = "/"
        count2 = operators.filter { $0 == charToCount }.count
        count = 0
        count3 = 0
        while (count2 != 0)
        {
            print(operators)
            print(numbers)
            count = 0
            count3 = 0
            for i in operators
            {
                if  (i == "/" && count3 < 1)
                {
                    print(i)
                    new_num = numbers[count] / numbers[count + 1]
                    operators.remove(at:count)
                    numbers.replaceSubrange(count...count+1, with: [new_num])
                    print(numbers)
                    count2 -= 1
                    count3 += 1 // did once, stop
                }
                count += 1
            }
        }

        
        
        charToCount = "+"
        count2 = operators.filter { $0 == charToCount }.count
        count = 0
        count3 = 0
        while (count2 != 0)
        {
            print(operators)
            print(numbers)
            count = 0
            count3 = 0
            for i in operators
            {
                if  (i == "+" && count3 < 1)
                {
                    print(i)
                    new_num = numbers[count] + numbers[count + 1]
                    operators.remove(at:count)
                    numbers.replaceSubrange(count...count+1, with: [new_num])
                    print(numbers)
                    count2 -= 1
                    count3 += 1 // did once, stop
                }
                count += 1
            }
        }
        
        
        charToCount = "-"
        count2 = operators.filter { $0 == charToCount }.count
        count = 0
        count3 = 0
        while (count2 != 0)
        {
            print(operators)
            print(numbers)
            count = 0
            count3 = 0
            for i in operators
            {
                if  (i == "-" && count3 < 1)
                {
                    print(i)
                    new_num = numbers[count] - numbers[count + 1]
                    operators.remove(at:count)
                    numbers.replaceSubrange(count...count+1, with: [new_num])
                    print(numbers)
                    count2 -= 1
                    count3 += 1 // did once, stop
                }
                count += 1
            }
        }
        formula = ""
        var something = String(numbers[0])
        if something.first == "-"
        {
            something.removeFirst()
            something = "!" + something
            
            return (something, lastOp, formula)
                //lblOutlet.text = something
        }
        else{
            return (String(numbers[0]), lastOp,formula)
            //lblOutlet.text = String(numbers[0])
        }
        
        
        print(numbers)
        print("finish")
        
    }
    
    
}
    
