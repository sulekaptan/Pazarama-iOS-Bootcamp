//
//  RomanToInt.swift
//  RomanConverterApp
//
//  Created by Kaan Yıldırım on 14.10.2023.
//

import Foundation

class RomanToInt {
    
    init() {
        print("Solution class created\n")
    }
    
    let baseNums: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
    ]
    
    func checkValidationOfRomanSequence(_ romanString: String) -> Bool
    {
        let regex = try! NSRegularExpression(pattern: "^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$")
        let range = NSRange(location: 0, length: romanString.utf16.count)
        
        let returnBool = regex.firstMatch(in: romanString, options: [], range: range) != nil
        return returnBool
    }
    
    func convertRomanToInt(_ romanString: String) -> Int
    {
        var result: Int = 0
        
        let upperRoman = romanString.uppercased()
        
        if !checkValidationOfRomanSequence(upperRoman) || !romanString.isAlphanumeric
        {
            print("Invalid roman string")
            return -1;
        }
        let reversedUpperRoman = upperRoman.reversed()
        
        var previosValue = 0
        
        for char in reversedUpperRoman {
    
            guard var currentIntValue = baseNums[char] else {
                return -1;
            }
        
            if (currentIntValue < previosValue)
            {
                currentIntValue *= -1
            }
            
            previosValue = currentIntValue
            result += previosValue
        }
        
        return result
    }
    
    func run_test_cases() {
        
        let test_cases: [String: Int] = ["I": 1,"V": 5,"X": 10,"L":50,"C":100,"D":500,"M":1000,"II":2, "III":3,"VI":6,"VII":7,"XI":11,"XII":12,"LX":60,"IV": 4,"IX":9,"XC":90,"XL":40,"XLVI":46, "XCVIII": 98, "CDXLVI": 446, "MCMXCVII": 1997, "A": -1, "B": -1, "E": -1,"VV": -1,"MMMMCMXC" : 4990, "MMMMCMXCIX": 4999, "DD": -1, "MMMMM": -1, "MCMXCVIII": 1998, "MMCCCXXIII": 2323, "MMMMCMXCIII": 4993, "5": -1, "IV5": -1]
        for current_case in test_cases {
            let input_roman = current_case.key
            let expected_int_value = current_case.value
            let res = convertRomanToInt(input_roman)
            
            if(res==expected_int_value)
            {
                print("Current test case: ",input_roman)
                print("Expected: ",expected_int_value, " --- Found:", res)
                print("PASSED")
            }
            else
            {
                print("Current test case: ",input_roman)
                print("Expected: ",expected_int_value, " --- Found:", res)
                print("FAILED")
            }
        }
    }
}

