import UIKit

var firstName: String = "Abylkairkhan"
var lastName: String = "Sarsetayev"
var age: Int = 20
let birthYear: Int = 2004
let currentYear: Int = 2024
age = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.80

var cityOfBirth: String = "Zhezkazgan"
var favoriteColor: String = "Black"
var lovesCoding: Bool = true

var hobby: String = "Hiking"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 5
var isHobbyCreative: Bool = false

var secondHobby: String = "Fishing"
var hobbyFrequency: Int = 1

var futureGoals: String = "In the future, I want to work in FAANG companies as a software engineer."

var creativeDescription: String = isHobbyCreative ? "a creative hobby" : "not a creative hobby"

var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently a student.
I enjoy \(hobby), which is \(creativeDescription). I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
I was born in \(cityOfBirth) and my favorite color is \(favoriteColor). \(futureGoals)
"""

print(lifeStory)
