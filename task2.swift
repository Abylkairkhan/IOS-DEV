import UIKit

// Easy task

// 1. Array Crea4on and Access

let fruits = ["apple", "banana", "melon", "pineapple", "strawberry"]

print(fruits[3])

// 2. Set Crea4on and Manipula4on

var numbers: Set = [1,2,3,4,5,6,7,8]

numbers.insert(9)

print(numbers)

// 3. Dictonary Creation and Access

let languages = ["Swift": 2019, "Kotlin": 2011, "Java": 1996]
// Kotlin better :)

print(languages["Swift"]!)

// 4. Array Element Update

var colors = ["red", "white", "black", "green"]

colors[1] = "yellow"

print(colors)


// Medium Tasks

// 1. Set Intersec4on

let set1: Set = [1,2,3,4]
let set2: Set = [3,4,5,6]
var intersectionSet: Set<Int> = []

for number in set1 {
    if set2.contains(number) {
        intersectionSet.insert(number)
    }
}

print(intersectionSet)

// 2. Dic4onary Update

var students = ["Aman": 2, "Aidar": 3, "Abyl": 4]

students.updateValue(5, forKey: "Aman")

print(students)

// 3. Array Merge

let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]
var array3 = [String]()

for index in array1.indices {
    array3.append(array1[index])
    array3.append(array2[index])
}

print(array3)


// Hard Tasks

// 1. Dic4onary Key Addi4on

var countries: [String: Int] = [
    "Kazakhstan": 19620000,
    "China": 1411778724,
    "USA": 331002651
]

countries["India"] = 1380004385

print(countries)

// 2. Set Union and Subtract

let sset1: Set<String> = ["cat", "dog"]
let sset2: Set<String> = ["dog", "mouse"]
var union = Set<String>()

for animal in sset1 {
    union.insert(animal)
}

for animal in sset2 {
    union.insert(animal)
}

for animal in sset2 {
    union.remove(animal)
}

print(union)
