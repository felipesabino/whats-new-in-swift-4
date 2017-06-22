/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## Composing classes and protocols

 Spec: [SE-0156][SE-0156]
 
 Pode ser escrito código equivalente ao ObjC `UIViewController <SomeProtocol> *` em Swift.
 
 Ou seja, você pode declarar uma variável de um tipo concreto e reduzir o escopo a implementação de um ou mais protocols ao mesmo tempo.
 
 Sintaxe: `let variable: Classe & Protocol1 & Protocol2`.

 [SE-0156]: https://github.com/apple/swift-evolution/blob/master/proposals/0156-subclass-existentials.md "Swift Evolution Proposal SE-0156: Class and Subtype existentials"
 */
class MyView {
    func viewFunc() { /* do something */ }
}
protocol HeaderView {}

class MyController {
    let header: MyView & HeaderView

    init(header: MyView & HeaderView) {
        self.header = header
        header.protocolFunc()
        header.viewFunc()
    }
}

// Neste caso não é possivel passa somente uma `MyView` que não implemente o protocol `HeaderView`
// MyController(header: MyView())
// error: argument type 'MyView' does not conform to expected type 'MyView & HeaderView'

// É obrigatório passar uma subclasse de MyView que implemente o protocolo

extension MyView: HeaderView {
    func protocolFunc() { /* do something */ }
}

MyController(header: MyView()) // works

/*:
 
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
