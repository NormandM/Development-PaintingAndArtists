//: Playground - noun: a place where people can play
import UIKit
struct Queue<Element> {
    var array: [Element] = []
    var isEmpty: Bool  {
        if array.count == 0  {
            return true
        }else{
            return false
        }
    }
    var count: Int {
        return array.count
    }
    mutating func enqueue(_ new: Element){
        array.append(new)
    }
    mutating func dequeue() -> Element? {
        if array.count == 0{
            return nil
        }else{
            var last = array[0]
            array.removeFirst()
            return last
        }
    }
}
//Associated Types

protocol ConfigurableRow {
    associatedtype Object
    func configure(with object: Object)
}



