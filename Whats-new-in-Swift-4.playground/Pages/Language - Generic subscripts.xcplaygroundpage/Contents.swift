/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## Generic subscripts
 
 Subscripts são atalhos para acessar membros de uma collection
 
 Spec: [SE-0148][SE-0148]
 
 Subscripts agora podem ter argumentos e retornos genéricos.
 
 [SE-0148]: https://github.com/apple/swift-evolution/blob/master/proposals/0148-generic-subscripts.md "Swift Evolution Proposal SE-0148: Generic Subscripts"
 
 O exemplo abaixo usa um tipo que representa dados JSON: você pode definir um subscript genérico que tem o tipo dependendo do contexto quando ele  é chamado.
 
 */
struct JSON {
    private var storage: [String:Any]

    init(dictionary: [String:Any]) {
        self.storage = dictionary
    }

    subscript<T>(key: String) -> T? {
        return storage[key] as? T
    }
}

let json = JSON(dictionary: [
    "name": "Berlin",
    "country": "de",
    "population": 3_500_500
    ])

// No need to use as? Int
let population: Int? = json["population"]
 

/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
