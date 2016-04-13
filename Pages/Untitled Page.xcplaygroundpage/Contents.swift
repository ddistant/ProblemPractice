//: Playground - noun: a place where people can play

import UIKit
import Foundation

//reverse a string

func reverseString(str: String) -> String {
    var arr : [Character] = []
    
    for i in 0...str.characters.count {
        if i < str.characters.count {
            arr.insert(Array(str.characters)[i], atIndex: 0)
        }
        
    }
    
    let result = String(arr)
    
    return result
}

//determine if a string is a palindrome

func isPalindrome(str: String) -> Bool {
    
    var characterArray : [Character] = []
    
    for i in 0...str.characters.count - 1 {
        characterArray.insert(Array(str.characters)[i], atIndex: 0)
    }
    
    let reversedString = String(characterArray)
    
    if reversedString == str {
        return true
    }
    
    return false
}

//determine if an integer is a palindrome

func isNumPalindrome(num: Int) -> Bool {
    
    var characterArray : [Character] = []
    
    let numberString = String(num)
    
    for i in 0...numberString.characters.count - 1 {
        characterArray.insert(Array(numberString.characters)[i], atIndex: 0)
    }
    
    if let reversedNumber = Int(String(characterArray)) {
        if reversedNumber == num {
            return true
        }
    }

    return false
}

//return a string with all of the vowels removed. 'y' is a consonant

func removeVowels(var str: String) -> String {
    
    let vowels : [Character] = ["a", "e", "i", "o", "u"]
    
    var strArray = Array(str.characters)
    
    var removedVowel = true
    
    while removedVowel {
        
        removedVowel = false
        
        for i in 0..<strArray.count {
            if vowels.contains(strArray[i]) {
                strArray.removeAtIndex(i)
                removedVowel = true
                break
            }
        }
    }
    
    str = String(strArray)
    
    return str
    
}

//given a number, return its factorial

func factorial(num: Int) -> Int {
    if num == 1 {
        return 1
    }
    
    return num * factorial(num - 1)
}

//For every multiple of 3, return "fizz", for 5 return "buzz," for both return "fizzbuzz"

func fizzBuzz(upTo num: Int) {
    
    for i in 1...num {
        if i % 3 == 0 && i % 5 == 0 {
            print("fizzbuzz")
        } else if i % 3 == 0 {
            print("fizz")
        } else if i % 5 == 0 {
            print("buzz")
        } else {
            print(i)
        }
    }
}

//implement bubble sort

func bubble_sort(inout arr:[Int])-> [Int] {
    
    var swapping = true
    
    while (swapping) {
        
        swapping = false
        
        for i in 0..<arr.count - 1 {
                if arr[i] > arr[i + 1] {
                    swap(&arr[i], &arr[i + 1])
                    swapping = true
                }
            }
        }
    
    return arr
}


//implement quick sort 

func partition(inout arr:[Int], firstIdx: Int, lastIdx: Int) -> Int {
    
    var leftMark = firstIdx
    
    var rightMark = lastIdx
    
    //get the pivot
    
    let sortedArray = arr.sort()
    
    let pivot = arr[sortedArray.count / 2]
    
    while leftMark < rightMark {
        
        if (arr[leftMark] > pivot) && (arr[rightMark] < pivot) {
            
            swap(&arr[leftMark], &arr[rightMark])
            
        } else if arr[leftMark] < pivot {
            
            leftMark += 1
            
        } else if arr[rightMark] > pivot {
            
            rightMark -= 1
        }
    }
    
    if firstIdx != rightMark {
        
        swap(&arr[firstIdx], &arr[rightMark])
    }
    
    return pivot
}

func quick_sort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    
    if firstIdx >= lastIdx {
        
        return
    }
    
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    
    let _ = partition(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    
    let _ = partition(&arr, firstIdx: splitPoint + 1, lastIdx: arr.count - 1)
}


//write an algorithm that returns change from a vending machine in the most efficient manner

var quarters = 0; var dimes = 0; var nickels = 0; var pennies = 0

func giveChange(changeLeft: Int) -> Int {
    
    if changeLeft == 0 {
        print("quarters: \(quarters) dimes: \(dimes) nickels: \(nickels) pennies: \(pennies)")
        return 0
    }
    if changeLeft >= 25 {
        ++quarters
        giveChange(changeLeft - 25)
    }
    if (changeLeft >= 10) && (changeLeft < 25) {
        ++dimes
        giveChange(changeLeft - 10)
    }
    if changeLeft >= 5 {
        ++nickels
        return giveChange(changeLeft - 5)
    } else {
        ++pennies
        return giveChange(changeLeft - 1)
    }
}

//find the sum of all the natural numbers of 3 or 5 below 1000

func sumMultiplesOfThreeAndFive(Below upperBound: Int) -> Int {
    var sum = 0
    
    for i in 0..<upperBound {
        if i % 3 == 0 || i % 5 == 0 {
           sum += i
        }
    }
    
    return sum
}

//find the sum of even fibonacci numbers up to 4 million

var fib_sum = 2

func sumEvenFibonacciNumbers(upTo upperBound: Int) -> Int {
    
    var first_fib = 1
    
    var second_fib = 2
    
    for _ in 0...upperBound {
        
        let next = first_fib + second_fib
        
        if next % 2 == 0 {
            fib_sum += next
        }
        
        first_fib = second_fib
        second_fib = next
    }
    
    return fib_sum
}

func findNthFibonacciNumber(num: Int) -> Int {
    
    var first_fib = 1
    
    var second_fib = 2
    
    for _ in 2..<num {
        let next_fib = first_fib + second_fib
        
        first_fib = second_fib
        
        second_fib = next_fib
    }
    
    return second_fib
}

func returnMedianValue(num1: Int, num2: Int, num3: Int) -> Int {
    if num1 > num2 && num1 < num3 {
        return num1
    }
    
    if num2 > num1 && num2 < num3 {
        return num2
    } else {
        return num3
    }
}

//returnMedianValue(30, num2: 5, num3: 96)

//find the largest prime factor of 600,851,475,143

func getLargestPrime(num: Int) -> Int {
    
    for i in 2..<num {
        if num % i == 0 {
            return getLargestPrime(num / i)
        }
    }
    
    return num
}

//find the most common character in a string

func findMostCommonCharacter(str: String) -> Character {
    
    //create a dictionary to hold each character(key) in the string and the amount of times its encountered(value)
    
    var dict = Dictionary<Character, Int>()
    
    //for every character in the string
    
    for i in Array(str.characters) {
        
        //if the char isn't in the string, make it a key with a value of 1
        
        if dict.indexForKey(i) == nil {
            dict.updateValue(1, forKey: i)
            
            //if it is in the dict already, update the value + 1
            
        } else {
            dict.updateValue(Int((dict[i]?.value)!) + 1, forKey: i)
        }
    }
    
    //create an array that will hold the characters and number of times they occurred in the string. necessary to sort values
    
    var arrDict : [(Character,Int)] = []
    
    //for every key-value pair in the dictionary, make it a tuple and append it to the array
    
    for j in dict {
        arrDict.append(j.0,j.1)
        print(j)
    }
    
    //do bubble sort on the array, that way the largest value is at the beginning (there is a more efficient way to do this part, I will probably refactor)
    
    var sorting = true
    
    while sorting {
        
        sorting = false
        
        for k in 0..<arrDict.count - 1 {
            if arrDict[k].1 < arrDict[k + 1].1 {
                swap(&arrDict[k], &arrDict[k + 1])
                sorting = true
                
            }
        }
    }
    
    return arrDict.first!.0
}

//find the largest palindrome made from the product of 2 three-digit numbers -- NOT DONE

func findLargestPalindrome() -> Int {
    
    var firstNum = 999
    
    var secondNum = 999
    
    var foundPalindrome = false
    
    var secondNumGenerate = false
    
    while !foundPalindrome {
        
        if isPalindrome(firstNum * secondNum) {
            foundPalindrome = true
            break
        } else {
            firstNum -= 1
            secondNumGenerate = !secondNumGenerate
            
            if !secondNumGenerate {
                secondNum -= 1
            }
        }
    }
    
    return firstNum * secondNum
}

func isPalindrome(var num : Int) -> Bool {
    
    var numArray : [Int] = []
    
    let minRange : Range = -10...10
    
    while num > 9 || num < -9 {
        numArray.append(num % 10)
        num = num / 10
        
        if minRange.contains(num) {
            numArray.append(num)
            break
        }
    }
    
    

    
    return true
}

//findLargestPalindrome()

//tree traversal

class Node<T: Comparable> {
    let value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T) {
        self.value = value
        
    }
}

extension Node {
    
    func BFS(value: T) -> Node? {
        
        //check the current node's value
        
        if self.value == value {
            return self
        }
        
        //check nodes that are attached
        
        for child in [left,right] {
            
            if child != nil {
              print("visited \(child?.value)")
            }
            
            if child?.value == value {
                return child
            }
        }
        
        //repeat process for left and right subtrees
        
        for child in [left, right] {
            if let result = child?.BFS(value) {
                return result
            }
        }
        
        //if you get here the value isn't in any of the nodes in the tree
        
        return nil
    }
    
    func printInorder() {
        left?.printInorder()
        print(value)
        right?.printInorder()
    }
    
    func printPreorder() {
        print(value)
        left?.printPreorder()
        right?.printPreorder()
    }
    
    func printPostorder() {
        left?.printPostorder()
        right?.printPostorder()
        print(value)
    }
    
    func preorder_DFS(value: T) -> Node? {
        
        if self.value == value {
            return self
        }
        
        for child in [left, right] {
            if let result = child?.preorder_DFS(value) {
                return result
            }
        }
        
        //here for postorder_DFS
        
//        if self.value == value {
//            return self
//        }
        
        return nil
    }
}

//let a = Node(value: 1)
//let b = Node(value: 2)
//let c = Node(value: 3)
//let d = Node(value: 4)
//let e = Node(value: 5)
//let f = Node(value: 6)
//let g = Node(value: 7)
//
//d.left = b
//b.left = a
//b.right = c
//d.right = f
//f.left = e
//f.right = g

func insertion_sort<T: Comparable>(inout values: [T]) {
    
    for i in 1..<values.count {
        
        var j = i
        while j > 0 && values[j - 1] > values[j] {
            if values[j] < values[j - 1] {
                swap(&values[j], &values[j - 1])
            } else {
                break
            }
            
            j -= 1
        }
    }
}

//return

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

func createArray() -> [Int] {
    
    var array = [Int]()
    for i in 1...100 {
        array.append(i)
    }
    
    let random: Int = Int(arc4random_uniform(200)) - 50
    array.append(random)
    
    let shuffledArray = array.shuffle()
    return shuffledArray
}

//given an array of 101 integers from 1-100, find the random one that doesn't belong

func findRandomNum(arr: [Int]) -> Int {
    
    let rangeSet = Set(1...100)
    
    for i in 0...arr.count - 1 {
        
        //if its not in range of 1-100, not a duplicate
        
        if !rangeSet.contains(arr[i]) {
            return arr[i]
        }
    }
    
    let arrSorted = arr.sort()
    
    //in range, is a duplicate
    
    for j in 0...arrSorted.count - 1 {
        if arrSorted[j] == arrSorted[j + 1] {
            return arrSorted[j + 1]
        }
    }
    
    return 0
}

//given an array of 101 integers from 1-100, find the random one that doesn't belong

func findRandomNumberFaster(arr: [Int]) -> Int {
    
    var sum = 0
    var sum2 = 0
    
    for i in 0...arr.count - 1 {
        sum += arr[i]
    }
    
    for var j = 0; j <= 100; j++ {
        sum2 += j
    }
    
    return sum - sum2
}

//var elbersArray = createArray()

//for the first 100 natural numbers, find the difference between the sum of the squares and the square of the sum

func findDifference(UpTo num: Int) -> Int {
    
    var sumOfSquares = 0
    var squareOfSum = 0
    
    for i in 1...num {
      sumOfSquares += (i * i)
      squareOfSum += i
    }
    
    return sumOfSquares - (squareOfSum * squareOfSum)
}

//find the 13 adjacent digits in a series that lead to the largest product

func findGreatestProductOf(num: Int, adjacentNumbers arr: [Int]) -> Int {
    
    var maxProduct = 1
    var counter = 0
    
    for _ in 0..<arr.count {
        
        if (counter + num) > arr.count {
            break
        }
        
        let slice = arr[counter..<(counter + num)]
        
        if (slice.reduce(1, combine: *)) > maxProduct {
            maxProduct = slice.reduce(1, combine: *)
            print(maxProduct)
        }
        
        ++counter
        print(counter)
    }
    
    return maxProduct
}

//given two strings, find whether you can make the first string out of the letters in the second string

func isAnagram(str: String, Of str2: String) -> Bool {
    
    let strArray = Array(str.characters)
    let str2Array = Array(str2.characters)
    
    var strDict = Dictionary<Character, Int>()
    var str2Dict = Dictionary<Character, Int>()
    
    for i in strArray {
        
        if strDict[i]?.value == nil {
            strDict.updateValue(1, forKey: i)
            
        } else {
           strDict.updateValue(Int((strDict[i]?.value)!) + 1, forKey: i)
        }
    }
    
    for j in str2Array {
        if str2Dict[j]?.value == nil {
            str2Dict.updateValue(1, forKey: j)

        } else {
            str2Dict.updateValue(Int((str2Dict[j]?.value)!) + 1, forKey: j)

        }
    }
    
    for k in strDict.keys {
        if Int((strDict[k]?.value)!) > Int((str2Dict[k]?.value)!) {
            return false
        }
    }
    
    return true
}

//given a 2D array, rotate it 90 degrees to the right

//var array = [[1, 2, 3, 4, 5],
//            [6, 7, 8, 9, 10],
//            [11,12,13,14,15],
//            [16,17,18,19,20],
//            [21,22,23,24,25]]

//func rotateArray(arr: [[Int]]) -> [[Int]] {
//    
//    let arrCount = arr.count
//    
//    var rotatedArray = Array(count: arrCount, repeatedValue: Array(count: arrCount, repeatedValue: 0))
//    
//    for var row = arr.count - 1; row >= 0; row-- {
//        
//        let temp = arr[row]
//        
//        for i in 0..<temp.count {
//           
//        }
//    }
//    
//    return rotatedArray
//}

// read the integer n
//var n = 6
//
////Int(readLine()!)!
//
//var answerQueue = [String]()
//
//for var i = 0; i < n; i++ {
//    answerQueue.append(" ")
//}
//
//for var i = 0; i < n; i++ {
//    answerQueue.removeFirst()
//    answerQueue.append("#")
//    let answerString = String(answerQueue)
//    print(answerString)
//}

//print(stringArr)

//func findSquaresUpTo(upperBound : Int)-> [Int] {
//    
//    var squares = [1,4]
//    var firstNum = squares[0]
//    var secondNum = squares[1]
//    
//    for _ in 0...upperBound {
//        let thirdNum = ((secondNum - firstNum) + 2) + secondNum
//        squares.append(thirdNum)
//        firstNum = secondNum
//        secondNum = thirdNum
//    }
//    
//    return squares
//}
//
//print(findSquaresUpTo(1000))


//let regularTime : [Character] = ["1","2",":","4","5",":","5","4","P", "M"]
//
////readLine()!.characters.map {String($0)}.map {Character($0)}
//
//var regHours = Int(String(regularTime[0...1]))!
//let am_pm_string = String(regularTime[8...9])
//let reg_mins_secs = String(regularTime[2...7])
//
////check noon or midnight edge cases
//
//if String(regularTime) == "12:00:00PM" {
//    print("12:00:00")
//} else if String(regularTime) == "12:00:00AM" {
//    print("00:00:00")
//}
//
////check whether reg time is AM or PM
//
//if am_pm_string == "PM" {
//    regHours += 12
//    if regHours == 24 {
//        regHours = 12
//        print(String(regHours) + reg_mins_secs)
//    } else {
//        print(String(regHours) + reg_mins_secs)
//    }
//    
//} else {
//    if regHours == 12 {
//        regHours = 0
//    }
//    print("0" + String(regHours) + reg_mins_secs)
//}

/*
n chapters
each chapter has 1 - t problems
each page (starting at 1) has up to k problems, last page may have fewer than k problems
each chapter starts on a new page
*/

//read first line
//let bookInfo = [25, 10]
////readLine()!.characters.split(" ").map {String($0)}.map {Int($0)!}
//
//let chapters = bookInfo[0]
//let maxProblems = bookInfo[1] //maximum problems allowed per page
//
////read second line
//var problems_per_chapter = [1, 29, 94, 15, 87, 100, 20 ,55 ,100, 45 ,82 ,80, 100, 100, 3 ,53, 100 ,2 ,100 ,100, 100 ,100 ,100 ,100 ,1]
////readLine()!.characters.split(" ").map {String($0)}.map {Int($0)!}
//
////keeping track
//var problemNumber = 0
//var problems_per_page = 0 //problems actually on page currently
//var pageNumber = 0
//var chapterNumber = 0
//var specialProblems = 0
//
//func addChapter() {
//    chapterNumber += 1
//    problemNumber = 0
//    nextPage()
//}
//
//func nextPage() {
//    pageNumber += 1
//    problems_per_page = 0
//}
//
//func addProblem() {
//    if problems_per_page >= maxProblems {
//        nextPage()
//    } else {
//        problems_per_page += 1
//    }
//    
//    problemNumber += 1
//}
//
//func checkForSpecialProblem() {
//    if problemNumber == pageNumber {
//        specialProblems += 1
//    }
//}
//
//while !problems_per_chapter.isEmpty {
//    
//    //add chapter and problems
//    addChapter()
//    
//    for _ in 0...problems_per_chapter.first! {
//        addProblem()
//        
//        //check for special problem
//        checkForSpecialProblem()
//    }
//    
//    problems_per_chapter.removeFirst()
//}
//
//print(specialProblems)

//fill function

var pixels = [[2,0,0,2,2],
              [0,0,0,0,2],
              [0,0,0,2,0],
              [0,0,4,0,0],
              [2,2,2,0,0]]

func changePixel(pixel: Int, toPixel: Int) {
    //code
}

func getLeftPixel(arr: [[Int]], y: Int, x: Int) -> (Int, Int) { //y and x coords
    
    if x - 1 >= 0 {
        return (y, x - 1)
    }
    
    return (-1, -1) //out of bounds
}

func getRightPixel(arr: [[Int]], y: Int, x: Int) -> (Int, Int) {
    
    if x + 1 >= arr[y].count {
        return (y, x + 1)
    }
    
    return (-1, -1)
}

func getUpPixel(arr: [[Int]], y: Int, x: Int) -> (Int, Int) {
    
    let range = 0..<arr.count
    
    if range.contains(y + 1) {
        return (y - 1, x)
    }
    
    return (-1, -1)
}

func getDownPixel(arr: [[Int]], y: Int, x: Int) -> (Int, Int) {
    
    let range = 0..<arr[y].count
    
    if range.contains(y + 1) {
        return (y + 1, x)
    }
    
    return (-1, -1)
}
