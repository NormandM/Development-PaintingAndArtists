// MAP
//let numbers = [1,2,3,4,5]
//let numberStrings = numbers.map() {String($0)}

// FlatMap

//let numbers = [[1,2,3], [4,5,6], [7,8,9]]
//let flatNumbers = numbers.flatMap(){$0}
//print(flatNumbers)

// Filter
let numbers = [10,423,802,765,943,12,405,230,1348,128,237]
let oddValues = numbers.filter{$0 % 2 != 0}
print(oddValues)

// reduce
let ages = [12,10,11,42,35,27,91,82,26,33,37,15]
let total = ages.reduce(0, {tot, age in tot + age})
print(total)






