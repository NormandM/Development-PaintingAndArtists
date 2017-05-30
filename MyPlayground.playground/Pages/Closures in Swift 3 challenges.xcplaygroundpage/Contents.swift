
import Foundation

func addTwo(to int: Int) -> Int {
    return int + 2
}
let addition = addTwo
//let result = addition(4)

/////////////////////////////////

extension String {
    func transform (_ afunction: (String) -> String) -> String {
    return afunction(self)
    }
}
func removeVowels(from string: String) -> String {
    var stringNew: String = ""
    for charact in string.characters {
        stringNew = stringNew + String(charact)
        if charact == "i" || charact ==  "a" || charact ==  "e" || charact ==  "o" || charact == "u" || charact == "y" {
            stringNew = String(stringNew.characters.dropLast())
        }else{
            
        }
    }
    return stringNew
}

let result =  "Hello, World".transform(removeVowels(from:))
////////////////////////////

func doubleInt() -> (Int) -> (){
    var carre : Int = 2
    
    func puissance2 (_ arg: Int) -> () {
        carre = arg * carre
        print(carre)
    }
    return puissance2
}
let resulatCarre = doubleInt()
resulatCarre(2)
resulatCarre(2)
resulatCarre(4)
////////////////////////////////////
//func double(_ i: Int) -> Int {
//    return i * 2
//}

//11let doubler = double
[1,2,3,4].map {$0 * 2}


