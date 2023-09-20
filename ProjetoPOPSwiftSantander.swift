import Foundation

protocol Automobile{
  var name: String{get}
  var canDrive: Bool{get}
}

protocol Pilotable{
  var maxSpeed: Double{get}
}

protocol Purchasable{
  var forSale: Bool {get}
  
}


struct Carro: Pilotable, Automobile{
  let name: String
  let canDrive: Bool = true
  let km: Double 
  let hour: Double = 1

  var maxSpeed: Double{
    km * hour
  }
}

struct Moto: Pilotable, Automobile, Purchasable{
  let name: String
  let canDrive: Bool = false
  let km: Double 
  let hour: Double = 1
  let forSale: Bool = true

  var maxSpeed: Double{
    km * hour
  }


}
enum Bike: Automobile{
  case yellow
  case green
  case unknown

  var name: String{
    switch self{
      case .yellow: return "Bike Amarela"
      case .green: return "Bike verde"
      case .unknown: return "Bike"
    }
  }
  
}
extension Bike{
  var canDrive: Bool{
    self != .unknown
  }
}

let kawasaki = Moto(name:"Kawasaki", km:200.0)
print("\(kawasaki.name) corria na velocidade de \(kawasaki.maxSpeed)km/h e \(kawasaki.forSale ? "está a venda": "não está a venda"). E \(kawasaki.canDrive ? "está funcionando": "não está funcionando")")



let bmw = Carro(name:"BMW", km:290.0 )
print("\(bmw.name) corre na velocidade de \(bmw.maxSpeed)km/h")

var bikes: [Automobile] = []

for tipoBike in [Bike.yellow, Bike.green, Bike.unknown] {
    bikes.append(tipoBike)
}

for bike in bikes {
    print("\(bike.name) \(bike.canDrive ? "pode ser conduzida" : "não pode ser conduzida")")
}
