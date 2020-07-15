//
//  main.swift
//  Homework 1.5
//
//  Created by Александр Хофф on 12.07.2020.
//

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

import Foundation

//1.
enum EngineCar: CustomStringConvertible {
    case on, off
    var description: String {
        switch self {
        case .on:
            return "активен"
        case .off:
            return "не активен"
        }
    }
}
enum WindowCar: CustomStringConvertible {
    case open, clased
    var description: String {
        switch self {
        case .clased:
            return "закрыты"
        case .open:
            return "открыты"
            
        }
    }
}
enum Action {
    case switchEngine (EngineCar)
    case swinchWondow (WindowCar)
}
//2.
protocol Car {
    var model: String {get}
    var year: Int {get}
    var engine: EngineCar {get set}
    var window: WindowCar {get set}
    
    func action(action: Action)
}

extension Car {
    mutating func setEngineCar(status: EngineCar) {
        engine = status
    }
    mutating func setWindowCar(status: WindowCar) {
        window = status
    }
}
//3.
class TrunkCar: Car {
    enum TrunkDescription: CustomStringConvertible {
        case unload, full
        var description: String {
            switch self {
            case .unload:
                return "пустой"
            case .full:
                return "загружен"
            }
        }
    }
    enum BodyCar: CustomStringConvertible {
        case open, closed, wagon
        var description: String {
            switch self {
            case .open:
                return "открыта"
            case .closed:
                return "закрыта"
            case .wagon:
                return "фура"
            }
        }
    }
    var model: String
    var body: BodyCar?
    var year: Int
    var trunk: TrunkDescription?
    var volumeTrunk: Double
    var engine: EngineCar
    var window: WindowCar
    var fullTrunk: Double?
    
    init?(model: String, body: BodyCar, year: Int, trunk: TrunkDescription, volumeTrunk: Double, engine: EngineCar, window: WindowCar, fullTrunk: Double) {
        if volumeTrunk == 10000 || fullTrunk < 1000 || fullTrunk > volumeTrunk {
            print("nГрузоподъемность автомобиля 1000 килограмм.\nБагажное отделение пустое.\nДанный груз не вмещается в багажное отделение!")
        }
        self.model = model
        self.year = year
        self.body = body
        self.trunk = trunk
        self.engine = engine
        self.window = window
        self.fullTrunk = fullTrunk
        self.volumeTrunk = volumeTrunk
    }
    func action(action: Action) {
        switch action {
        case.switchEngine(let status):
            engine = status
        case.swinchWondow(let status):
            window = status
        }
    }
}
//4.
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки\(model)\nГод выпуска \(year)\nКузов \(body?.description ?? "отцеплен")\nГрузоподъемноть\(volumeTrunk)\nСостояние двигателя \(engine)\nОкна автомобиля\(window.description)\nГруз объемом \(String(describing: fullTrunk))"}
}
//5.
var lorry = TrunkCar(model: "Kamaz", body: .wagon, year: 2015, trunk: .full, volumeTrunk: 20000, engine: .off, window: .open, fullTrunk: 10000)
lorry?.description
lorry?.action(action: .swinchWondow(.clased))
lorry?.description

class SportCar: Car {
    enum TurboCar: CustomStringConvertible {
        case on, off
        var description: String {
            switch self {
            case .on:
                return "активна"
            case .off:
                return "не активна"
            }
        }
    }
    var model: String
    var year: Int
    var engine: EngineCar
    var window: WindowCar
    var turbo: TurboCar?
    init(model: String, year: Int, engine: EngineCar, window: WindowCar, turbo: TurboCar) {
        self.model = model
        self.year = year
        self.engine = engine
        self.window = window
        self.turbo = turbo
    }
    func action(action: Action) {
        switch action {
        case.switchEngine(let status):
            engine = status
        case.swinchWondow(let status):
            window = status
        }
    }
}
//4.
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки \(model)\nГод выпуска \(year)\nСостояние двигателя \(engine.description)\nОкна \(window.description)\nТурбина \(String(describing: turbo?.description))"
    }
}
//5.
var car = SportCar(model: "Audi", year: 2013, engine: .on, window: .open, turbo: .on)
car.action(action: .swinchWondow(.open))
car.action(action: .switchEngine(.on))
car.description

