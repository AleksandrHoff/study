//
//  main.swift
//  Homework 1.4
//
//  Created by Александр Хофф on 10.07.2020.
//

import Foundation

//
//  main.swift
//  Homework 1.3
//
//  Created by Александр Хофф on 06.07.2020.
//
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum MotorStatus {
    case on, off //перечеисляем статусы двигателя (включен или выключен)
}
enum FuelTank {
    case full,empty //перечисляем статусы топливного бака (пустой или полный)
}
class Car { // описываем класс "Car"
    let brand: String // бренд производителя
    let productionDate: Int //дата производства
    var motorStatus: MotorStatus // статус двигателя
    var fuelTank: FuelTank //статус топливного бака
    
    init(brand: String, productionDate: Int) {
        self.brand = brand
        self.productionDate = productionDate //инициализируем "Car"
        self.motorStatus = .on // говорим, что двигатель включен
        self.fuelTank = .empty // говорим, что топливный бак полон
    }
    
    func setMotorStatus(_ status: MotorStatus) {
        self.motorStatus = status // записываем в функцию статус двигателя "Car"
    }
}

class SportCar: Car { // описываем класс "SportCar"
    var Turbocharged: Int // создаем отличительное свойство в виде турбонагнетателя
    init(brand: String, productionDate: Int, turbocharged: Int) { // производим инициализацию
        self.Turbocharged = turbocharged
        super.init(brand: brand, productionDate: productionDate)// наследуем свойства "Car"
    }
    override func setMotorStatus(_ motorStatus: MotorStatus) {
        super.setMotorStatus(motorStatus)
        print("Двигатель спортивного автомобиля \(brand): \(motorStatus)") // просим вывести стутус двигателя "SportCar"
    }
    func turbocharged(_ turbocharged: Int) {
        self.Turbocharged = turbocharged
        print("Мощность турбонагнетателя \(brand): \(turbocharged) БАР") // просим вывести мощность турбонагнетателя "SportCar"
    }
}
class TrunkCar: Car { // описываем класс "TrunkCar"
    var trunkVolume: Int // создаем отличительное свойство в виде объема багажника свейственного для грузовых авто
    init(brand: String, productionDate: Int, trunkVolume: Int) { // производим инициализацию
        self.trunkVolume = trunkVolume
        super.init(brand: brand, productionDate: productionDate) // наследуем свойства "Car"
    }
    override func setMotorStatus(_ motorStatus: MotorStatus) {
        super.setMotorStatus(motorStatus)
        print("Двигатель грузового автомобиля \(brand): \(motorStatus)")// просим вывести стутус двигателя "TrunkCar"
    }
    func setTrunkVolume(_ trunkVolume: Int) {
        self.trunkVolume = trunkVolume
        print("Объем багажника \(brand): \(trunkVolume) кубов") //просим вывести объем багажного отделения "TrunkCar"
    }
}

var trunk = TrunkCar(brand: "Volvo", productionDate: 2010, trunkVolume: 120)
var sport = SportCar(brand: "Audi", productionDate: 2020, turbocharged: 2)

sport.setMotorStatus(.on)
trunk.setMotorStatus(.on)
sport.turbocharged(2)
trunk.setTrunkVolume(120) // выводим на экран данные
