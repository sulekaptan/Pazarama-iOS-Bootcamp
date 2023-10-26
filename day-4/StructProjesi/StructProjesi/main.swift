//
//  main.swift
//  StructProjesi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import Foundation

/*
struct -> value type, stack(FILO), no inheritance, immutable, free initialization
class -> reference type, heap(FIFO), inheritance, mutable, obj-c
*/

let musicianClass = MusicianClass(name: "Şule", age: 23, instrument: "Gitar")
let musicianStruct = MusicianStruct(name: "Şule", age: 23, instrument: "Gitar")

print(musicianClass.name)
print(musicianStruct.name)

musicianClass.age += 1
print(musicianClass.age)

// musicianStruct.age += 1 //struct'da let ile tanımladığımız değerleri değiştiremeyiz. immutable

//reference vs value type
let copyOfMusicianClass = musicianClass
print(copyOfMusicianClass.age)
print(copyOfMusicianClass.name)

var copyOfMusicianStruct = musicianStruct
print(copyOfMusicianStruct.age)
print(copyOfMusicianStruct.name)

copyOfMusicianClass.age += 1
copyOfMusicianStruct.age += 1

print(copyOfMusicianClass.age)
print(copyOfMusicianStruct.age)

print(musicianClass.age)
print(musicianStruct.age)


//tuple -> bu da immutable'dır.
print("---tuple---")
let myTuple = (1,3,5)

print(myTuple.0)

var varTuple = (1,5,10)
varTuple.0 = 100
print(varTuple.0)

let myTuple2 = (10, "Şule", [10,20])
print(myTuple2.1)

let myTuple3 = (name: "Şule", age: 23)
print(myTuple3.age)

let myTuple4 : (String, String)
myTuple4.0 = "a"
myTuple4.1 = "b"


print("---guard let---")
let myNumber = "10"

func convertToIntegerGuard(stringInput:String) -> Int{
    guard let myInteger = Int(stringInput) else{
        return 0
    }
    return myInteger
}

func convertToIntegerIf(stringInput:String) -> Int{
    if let myInteger = Int(stringInput){
        return myInteger
    }else{
        return 0
    }
}
print(convertToIntegerGuard(stringInput: myNumber))


print("---closure---")
func sum(x:Int, y:Int) -> Int {
    return x + y
}
print(sum(x: 5, y: 10))

func calculate(x:Int, y:Int, myFunction: (Int, Int) -> Int) -> Int {
    return myFunction(x,y)
}
print(calculate(x: 10, y: 20, myFunction: sum))

let a = calculate(x: 10, y: 10) { x, y in //anonim fonk.
    return x + y
}
print(a)

let b = calculate(x: 10, y: 20, myFunction: {$0 * $1})
print(b)

let myNumberArray = [10,20,30,40,50,60,70]
func highOrderFunction(num: Int) -> Int {
    return num / 5
}
print(myNumberArray.map(highOrderFunction))

print(myNumberArray.map({$0 / 5}))
