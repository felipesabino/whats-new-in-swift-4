/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## Access Control

 aka ⚰️ `fileprivate`
 
 
 Spec: [SE-0169][SE-0169] 
 
 Declarações `private` agora são visíveis em extensions do mesmo tipo _no mesmo arquivo_.
 
 Isso possibilita separar a definição do tipo em diversas extensions e ainda manter o uso de `private` para os membros mais _privados_, se livrando assim do controverso `fileprivate` do Swift 3
 
 
 [SE-0169]: https://github.com/apple/swift-evolution/blob/master/proposals/0169-improve-interaction-between-private-declarations-and-extensions.md "Swift Evolution Proposal SE-0169: Improve Interaction Between private Declarations and Extensions"
 */

struct SortedArray<Element: Comparable> {
    private var storage: [Element] = []
    init(unsorted: [Element]) {
        storage = unsorted.sorted()
    }
}

extension SortedArray {
    mutating func insert(_ element: Element) {
        // storage is visible here
        storage.append(element)
        storage.sort()
    }
}

let array = SortedArray(unsorted: [3,1,2])
// storage _não é visível_ aqui (diferente do fileprivate)
// array.storage // error: 'storage' is inaccessible due to 'private' protection level

/*: [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
