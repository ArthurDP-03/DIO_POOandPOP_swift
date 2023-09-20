import Foundation

enum StoreSector {
    case shoes, clothes, make
}

struct Store {
    var nameStore: String
    var sector: StoreSector
}

class CuritibasShopping {
    var localizacao: String
    
    init(localizacao: String) {
        self.localizacao = localizacao
    }
    
 
    func printLocalizacao() {
        print("Localização: \(localizacao)")
    }
}

class Shopping: CuritibasShopping {
    var name: String
    var stores: [Store] = []

    init(name: String, localizacao: String) {
        self.name = name
        super.init(localizacao: localizacao)
    }

    // Adicionar loja ao shopping
    func add(_ store: Store) {
        stores.append(store)
    }
    func sectorShoes(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            let shoesStores = self.stores.filter { $0.sector == .shoes }
            for store in shoesStores {
                print("Setor Shoes: \(store.nameStore)")
            }
            completion()
        }
    }

    func sectorClothes(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            let clothesStores = self.stores.filter { $0.sector == .clothes }
            for store in clothesStores {
                print("Setor Clothes: \(store.nameStore)")
            }
            completion()
        }
    }

    func sectorMakes(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            let makeStores = self.stores.filter { $0.sector == .make }
            for store in makeStores {
                print("Setor Makes: \(store.nameStore)")
            }
            completion()
        }
    }
}

let store1 = Store(nameStore: "Renner", sector: .clothes)
let store2 = Store(nameStore: "Centauro", sector: .shoes)
let store3 = Store(nameStore: "Sephora", sector: .make)
let store4 = Store(nameStore: "MakeB", sector: .make)

let shopping1 = Shopping(name: "ShoppingBarigui", localizacao: "Curitiba")
shopping1.add(store1)
shopping1.add(store2)
shopping1.add(store3)
shopping1.add(store4)

let queue = DispatchQueue.global()

queue.async {
    shopping1.sectorClothes {
        print("Setor Clothes concluído.")
    }
}

queue.async {
    shopping1.sectorMakes {
        print("Setor Makes concluído.")
    }
}

queue.async {
    shopping1.sectorShoes {
        print("Setor Shoes concluído.")
    }
}

queue.async {
    shopping1.printLocalizacao()
}