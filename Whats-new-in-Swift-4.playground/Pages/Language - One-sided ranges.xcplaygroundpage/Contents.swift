/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)
 
 ## One-sided ranges

 Spec: [SE-0172][SE-0172] 
 
 Foi introduzido um novo protocolo `RangeExpression` e diversos outros operadores para criar one-sided ranges.
 
 Ou seja, ranges onde o limite inferior ou superior não é especeficado.

 [SE-0172]: https://github.com/apple/swift-evolution/blob/master/proposals/0172-one-sided-ranges.md "Swift Evolution Proposal SE-0172: One-sided Ranges"
 
 ### Sequências infinitas
 
 Pode-se usar um one-sided range para se criar uma sequeência infinita, o que deixa mais flexível quando não se deseja começar uma numeração como `0` (zero):
 
 */
let letters = ["a","b","c","d"]
let numberedLetters = zip(1..., letters)
Array(numberedLetters)

/*:
 ### Collection subscripts
 
 Quando one-sided range é usado em um subscript de uma collection, o `startIndex` ou `endIndex` "preenchem" o limite inferior ou superior, respectivamente.
 */
let numbers = [1,2,3,4,5,6,7,8,9,10]
numbers[5...] // instead of numbers[5..<numbers.endIndex]

/*:
 ### Pattern Matching
 
 One-sided ranges também podem ser usados para contruir padrões de match, como por exemplo um `switch`.

 
 */
let value = 5
switch value {
case 1...:
    print("greater than zero")
case 0:
    print("zero")
case ..<0:
    print("less than zero")
default:
    fatalError("unreachable") //  Nota-se que o compilador não sabe (ainda?) se todos os casos do `switch` foram tratados.
}
/*: [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
