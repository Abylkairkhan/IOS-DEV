import Foundation

// Problem 1: FizzBuzz

for i in 1...100 {
    if i % 3 == 0 {
        print("Fizz")
    } else if(i % 5 == 0) {
        print("Buzz")
    } else {
        print(i)
    }
}

// Problem 2: Prime Numbers

for number in 1...100 {
    if isPrime(number: number) {
        print(number)
    }
}

func isPrime(number: Int) -> Bool {
    if number < 2 {
            return false
    }
    var counter = 0
    for i in 1...number {
        if number % i == 0 {
            counter += 1
        }
    }
    return counter == 2
}

// Problem 3: Temperature Converter

print("Enter the temperature type (C, F, K):")
var tempType = readLine()
print("Enter the temperature value:")
var tempValue = Double(readLine()!)!

func convertFromCelsius(_ celsius: Double) {
    let fahrenheit = (celsius * 9/5) + 32
    let kelvin = celsius + 273.15
    print("\(celsius)°C is \(fahrenheit)°F and \(kelvin)K")
}

func convertFromFahrenheit(_ fahrenheit: Double) {
    let celsius = (fahrenheit - 32) * 5/9
    let kelvin = celsius + 273.15
    print("\(fahrenheit)°F is \(celsius)°C and \(kelvin)K")
}

func convertFromKelvin(_ kelvin: Double) {
    let celsius = kelvin - 273.15
    let fahrenheit = (celsius * 9/5) + 32
    print("\(kelvin)K is \(celsius)°C and \(fahrenheit)°F")
}

if(tempType?.uppercased() == "C" && tempValue >= 0) {
    convertFromCelsius(tempValue)
} else if(tempType?.uppercased() == "F" && tempValue >= 0) {
    convertFromFahrenheit(tempValue)
} else if(tempType?.uppercased() == "K" && tempValue >= 0) {
    convertFromKelvin(tempValue)
}

// Problem 4: Shopping List Manager

var userCart: [String] = []
var isRunning = true

print("Welcome to Magnum")
while isRunning {
    print("Press 1 to add product")
    print("Press 2 to remove product")
    print("Press 3 to see cart")
    print("Press 4 to clear cart")
    print("Press 5 to exit")

    // Safely unwrap user input
    if let userAction = Int(readLine() ?? "") {
        switch userAction {
        case 1:
            addProductToCart()
        case 2:
            removeProductFromCart()
        case 3:
            seeCart()
        case 4:
            clearCart()
        case 5:
            print("Exiting program...")
            isRunning = false
        default:
            print("Invalid action. Please enter a valid number.")
        }
    } else {
        print("Invalid input. Please enter a number.")
    }
}

func addProductToCart() {
    print("Enter product name")
    if let product = readLine(), !product.isEmpty {
        userCart.append(product)
        print("Product '\(product)' successfully added to the cart.")
    } else {
        print("Invalid product name.")
    }
}

func removeProductFromCart() {
    print("Enter product name")
    let product = readLine() ?? ""
    for (index, item) in userCart.enumerated() {
        if item == product {
            userCart.remove(at: index)
            print("\(product) removed from the cart.")
            return
        }
    }
    print("\(product) not found in the cart.")
}

func seeCart() {
    if userCart.isEmpty {
        print("The cart is empty.")
    } else {
        print("Current cart items:")
        for product in userCart {
            print(product)
        }
    }
}

func clearCart() {
    userCart.removeAll()
    print("Cart cleared.")
}

// Problem 5: Word Frequency Counter

print("Enter the word")
if let sentence = readLine() {
    countWordFrequency(sentence)
}

func countWordFrequency(_ sentence: String) {
    var wordFrequency: [String: Int] = [:]
    let cleanedSentence = cleanSentence(sentence)
    let words = cleanedSentence.split(separator: " ").map { String($0) }
    
    for word in words {
        if let count = wordFrequency[word] {
            wordFrequency[word] = count + 1
        } else {
            wordFrequency[word] = 1
        }
    }
    
    print("Word Frequencies:")
    for (word, count) in wordFrequency {
        print("\(word): \(count)")
    }
}

func cleanSentence(_ sentence: String) -> String {
    let cleanedSentence = sentence.lowercased()
        .components(separatedBy: CharacterSet.punctuationCharacters)
        .joined()
    return cleanedSentence
}

// Problem 6: Fibonacci Sequence

print("Enter the number")
let number = Int(readLine()!)!
print("Result of Fibonacci sequence:")
print(fibonacci(number))

func fibonacci(_ n: Int) -> [Int] {
    var resultArray: Array<Int> = [0, 1]
    for _ in 2...n-1 {
        let nextNumber = resultArray[resultArray.count-1] + resultArray[resultArray.count-2]
        resultArray.append(nextNumber)
    }
    return resultArray
}

// Problem 7: Grade Calculator

var enteringData = true
var studentList: [String: Int] = [:]

while enteringData {
    print("If you end entering data press 0")
    print("Enter the student name:")
        if let studentName = readLine(), !studentName.isEmpty {
            if studentName == "0" {
                enteringData = false
                break
            }
            
            print("Enter the student grade:")
            if let studentGrade = Int(readLine() ?? ""), studentGrade > 0 {
                studentList.updateValue(studentGrade, forKey: studentName)
            } else {
                print("Invalid grade. Please enter a valid grade.")
            }
        } else {
            print("Invalid student name. Please enter a valid name.")
        }
}

var averageScore = calculateAverageScore(studentList)

for student in studentList {
    let comparison = student.value > Int(averageScore) ? "above" : "below"
    print("\(student.value) scored \(student.key) which is \(comparison) the average score of \(averageScore).")
}

func calculateAverageScore(_ studentList: [String: Int]) -> Double {
    var allScoresSum = 0
    for student in studentList {
        allScoresSum += student.value
    }
    return Double(allScoresSum) / Double(studentList.count)
}

// Problem 8: Palindrome Checker

print("Enter the word")
var word = readLine()

if(isPalindrome(word!)) {
    print("Word is palindrome")
} else {
    print("Word is not palindrome")
}

func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter { $0.isLetter }
    let characters = Array(cleanedText)
    for i in 0...cleanedText.count/2 {
        if characters[i] != characters[cleanedText.count-1-i] {
            return false
        }
    }
    return true
}

// Problem 9: Simple Calculator

var enterData = true

while enterData {
    print("Enter first number: ")
    let firstNumber = readNumber(prompt: "Enter the first number: ")
    let secondNumber = readNumber(prompt: "Enter the second number: ")
    
    print("Choose operation")
    print("Press 1 to [+]")
    print("Press 2 to [-]")
    print("Press 3 to [*]")
    print("Press 4 to [/]")
    print("Press 5 to exit")
    let userAction = Int(readLine()!)
    
    switch userAction {
    case 1:
        let result = add(firstNumber, secondNumber)
        print("Sum is: \(result)")
    case 2:
        let result = subtract(firstNumber, secondNumber)
        print("Subtraction is: \(result)")
    case 3:
        let result = multiply(firstNumber, secondNumber)
        print("Multiplication is: \(result)")
    case 4:
        if let result = divide(firstNumber, secondNumber) {
            print("Division is: \(result)")
        } else {
            print("Cannot divide by zero!")
        }
    case 5:
        enterData = false
    default:
        print("Cant define a operation")
    }
}

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func divide(_ a: Int, _ b: Int) -> Int? {
    if b == 0 {
        return nil // Handle division by zero
    }
    return a / b
}

func readNumber(prompt: String) -> Int {
    while true {
        print(prompt)
        if let input = readLine(), let number = Int(input) {
            return number // Return the valid number
        } else {
            print("Invalid input. Please enter a valid number.")
        }
    }
}

// Problem 10: Unique Characters

print("Enter the word")
if let word = readLine(), !word.isEmpty {
    if hasUniqueCharacters(word) {
        print("Word consist unique characters")
    } else {
        print("Word didnt consist unique characters")
    }
}

func hasUniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = [] // Use a set to track characters we have seen
    for char in text {
        if seenCharacters.contains(char) {
            return false // If the character is already in the set, it's not unique
        }
        seenCharacters.insert(char) // Add character to the set
    }
    return true
}

