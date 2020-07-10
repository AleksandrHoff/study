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

enum Action {
    case trailerOn;
    case trailerOff
    case engineOn
    case engineOff
    case turbineOn
    case turbineOff
}
class Car {
    let color: String
    let year: Int
    let model: String
    var vin: String
    init(color: String, year: Int, model: String, vin: String) {
        self.color = color
        self.year = year
        self.model = model
        self.vin = vin
        mutating func carAction (action: Action) {
            switch Action.self {
            case .engineOn:
                if engineOn == true {
                    print("Двигатель работает")
                }
                else {
                    print("Двигатель не работает")
                }
            }
        }
    }
}

class TrunkCar: Car {
    var trailer: Car      // Новое свойство
    init(color: String, year: Int, model: String, vin: String, trailer: TrunkCar) {
        self.trailer = trailer    // инициализируем новое свойство
        // используем конструктор из родителя, чтобы завершить инициализацию класса
        super.init(color: String, year: Int, model: String, vin: String)
    }
    
    func hitchedTrailer() {                  // Новый метод
        trailer = .hitched
    }
    
    func notHitchedTrailer() {                // Новый метод
        trailer = .notHitched
    }
    func TrunkCarAction (action: Action) {
        switch action {
        case .trailerOn:
            if trailerOn == true {
                print("Прицеп зацеплен")
            }
            else {
                print("Прицеа отцеплен")
            }
        }
    }
}
        
        class SportCar: Car {
            var turbine: Car      // Новое свойство
            init(color: String, year: Int, model: String, vin: String, turbine: SportCar) {
                self.turbine = turbine    // инициализируем новое свойство
                // используем конструктор из родителя, чтобы завершить инициализацию класса
                super.init(color: String, year: Int, model: String, vin: String)
            }
            
            func turbineOn() {                  // Новый метод
                turbine = .turbineOn
            }
            
            func turbineOff() {                // Новый метод
                turbine = .turbineOff
            }
            func carAction (action: Action) {
                switch action {
                case .turbineOn:
                    if turbineOn == true {
                        print("Турбина активна")
                    }
                    else {
                        print("Турбина не активна")
                    }
                }
            }
        }
init(color: String, year: Int, model: String, vin: String, turbine: SportCar) {
        self.model = model
        self.year = year
        self.engineWork = engineWork
        self.openWindows = openWindows
        self.vVolume = 2000
        self.fillTheVolume = 1000
    }

    func resultCar () {
        print("марка автомобиля \(model), год выпуска \(year), двигатель \(engineWork), окна \(openWindows), объем кузова \(vVolume), загрузка кузова \(fillTheVolume)")
    }
}










