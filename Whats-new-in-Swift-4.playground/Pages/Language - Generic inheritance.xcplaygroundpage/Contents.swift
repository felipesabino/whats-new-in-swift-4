/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)
 
 ## Generic inheritance
 
 Spec: [SR-1529][SR-1529]
 
 Sobreescrever métodos covariantes agora é totalmente suportado.
 
 [SR-1529]: https://github.com/apple/swift/pull/8314 "SILGen: Support for covariant method overrides"
 
 */
class Bed {}
class Nook : Bed {}

class Cat<T> {
    func eat(snack: T) {}
    func play(game: String) {}
    func sleep(where: Nook) {}
}

class Dog : Cat<(Int, Int)> {
    // 'T' agora é um tipo concreto
    override func eat(snack: (Int, Int)) {}
    
    // 'game' agora é opcional
    override func play(game: String?) {}
    
    // 'where' agora é a superclass
    override func sleep(where: Bed) {}
}

/*: [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
