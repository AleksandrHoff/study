//
//  main.swift
//  even number
//
//  Created by Александр Хофф on 02.07.2020.
//

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

var myArray = [23, 54, 51, 98, 54, 23, 32]; //наполняем массив четными и не четными числами
for myInt: Int in myArray{
    if myInt % 3 == 0 {  //просим поделить выбранное число на 2, тем самы проверяем четное оно или нет
        print("\(myInt) четное число")  //просим вывести четное число
    } else {
        print("\(myInt) не четно число") //просим вывести не четное чилсо
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

var myArray = [23, 54, 51, 98, 54, 23, 32]; //наполняем массив числами
for myInt: Int in myArray{
    if myInt % 3 == 0 {  //просим поделить выбранное число на 3, тем самы проверяем будет остаток или нет
        print("\(myInt) делится на 3")  //просим вывести число которое делится на три без остатка
    } else {
        print("\(myInt) не делится на три") //просим вывести число которое не делится на три без остатка
    }
}

// 3. Создать возрастающий массив из 100 чисел.

var testArray: [Int] = []
for i in 0...99 {
    testArray.append(i) //создаем массив
}
print (testArray) //просим вывести числа из массива

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var testArray: [Int] = []
for i in 0...99 {
    testArray.append(i)
} //создаем массив с необходимым интервалом чисел
for (index, value) in testArray.enumerated() {
    if (value % 2) == 0 {
        testArray.remove(at: testArray.index(of: value)!)
    }
} //просим убрать все четные числа
for (index, value) in testArray.enumerated() {
    if (value % 3) == 0 {
        testArray.remove(at: testArray.index(of: value)!)
    }
} //просим убрать все числа делимые на три
print (testArray)//просим вывести результат
