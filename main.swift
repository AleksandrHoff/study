//
//  main.swift
//  Homework 1.3
//
//  Created by Александр Хофф on 06.07.2020.
//

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum Action {
    case engineOn
    case openWindows
    case closeWindows
    case engineOff
    case cargoLoading
    case cargoUnloading
}

struct TruckCar {
    let model: String
    let year: Int
    let engineWork: Bool
    let openWindows: Bool
    let vVolume: Double
    let fillTheVolume: Double
    let trailer: Bool
    mutating func carAction (action: Action) {
        switch action {
        case .engineOn:
            if engineWork == true {
                print("Двигатель работает")
            }
            else {
                print("Двигатель не работает")
            }
        case .openWindows:
            if openWindows == true {
                print("Окна открыты")
            }
            else {
                print("Окна закрыты")
            }
            
        case .engineOff:
            if engineWork == true {
                print("Двигатель не работает")
            }
            else {
                print("Двигатель работает")
            }
        case .closeWindows:
            if openWindows == true {
                print("Окна закрыты")
            }
            else {
                print("Окна открыты")
            }
        case .cargoLoading(weight:  ):
            if fillTheVolume < vVolume {
                print("Нельзя загрузить")
            }
            else {
                print("груз загружен")
            }
        case .cargoUnloading(weight: ):
            if vVolume < fillTheVolume {
                print("Грузы выгружен")
            }
            else {
                print("груз не выгружен")
            }
            if trailer == true {
                print("Имеет  прицеп")
            }
            else {
                print("не имеет прицепа")
            }
        }
        
    }
    
    init(model: String, year: Int, engineWork: Bool, openWindows: Bool, vVolume: Double, fillTheVolume: Double, trailer: Bool) {
        self.model = model
        self.year = year
        self.engineWork = engineWork
        self.openWindows = openWindows
        self.vVolume = 20000
        self.fillTheVolume = 10000
        self.trailer = trailer
    }
    func resultTruckCar () {
        print("марка автомобиля \(model), год выпуска \(year), двигатель \(engineWork), окна \(openWindows), объем кузова \(vVolume), загрузка кузова \(fillTheVolume), прицеп \(trailer)")
    }
}

struct Car {
    let model: String
    let year: Int
    let engineWork: Bool
    let openWindows: Bool
    let vVolume: Double
    let fillTheVolume: Double
    mutating func carAction (action: Action) {
        switch action {
        case .engineOn:
            if engineWork == true {
                print("Двигатель работает")
            }
            else {
                print("Двигатель не работает")
            }
        case .openWindows:
            if openWindows == true {
                print("Окна открыты")
            }
            else {
                print("Окна закрыты")
            }
            
        case .engineOff:
            if engineWork == true {
                print("Двигатель не работает")
            }
            else {
                print("Двигатель работает")
            }
        case .closeWindows:
            if openWindows == true {
                print("Окна закрыты")
            }
            else {
                print("Окна открыты")
            }
        case .cargoLoading(weight:  ):
            if fillTheVolume < vVolume {
                print("Нельзя загрузить")
            }
            else {
                print("груз загружен")
            }
        case .cargoUnloading(weight: ):
            if vVolume < fillTheVolume {
                print("Грузы выгружен")
            }
            else {
                print("груз не выгружен")
            }
            
        }
    }
    
    init(model: String, year: Int, engineWork: Bool, openWindows: Bool, vVolume: Double, fillTheVolume: Double, trailer: Bool) {
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

