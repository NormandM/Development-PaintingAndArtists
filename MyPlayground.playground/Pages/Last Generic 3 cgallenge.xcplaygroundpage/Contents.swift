
import Foundation

protocol PrefixContaining {
    func hasPrefix(_ prefix: String) -> Bool
}

extension String: PrefixContaining {}

extension Array where Element: PrefixContaining {
    func filter(byPrefix prefix: String) -> [Element]{
        var output = [Element]()
        for element in self {
            if element.hasPrefix(prefix){
                output.append(element)
            }
        }
        return output
    }
    
}
let myArray = ["aa", "bc", "ar", "at", "dv"]
myArray.filter(byPrefix: "a")