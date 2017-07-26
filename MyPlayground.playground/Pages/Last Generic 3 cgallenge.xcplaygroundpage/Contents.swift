
import Foundation
extension String {
    func transform (_ aFunction: (String) -> String) -> String {
        return aFunction(self)
    }
}
func removeVowels (from word: String) -> String {
    var vowels: [Character] = []
    let results = word.characters
    for result in results{
        if result != "a" && result != "y" && result != "e" && result != "i" &&  result != "o" && result != "u"{
            vowels.append(result)
        }
    }
    return String(vowels)
}
let result = "Hello World!".transform(removeVowels)