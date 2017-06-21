/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## `Dictionary` and `Set` enhancements

 Spec: [SE-0165][SE-0165] 
 
 
 Adcionados diversas melhorias em `Dictionary` e `Set`.

 [SE-0165]: https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md "Swift Evolution Proposal SE-0165: Dictionary and Set Enhancements"
 
 ### Sequence-based initializer
 
 Cria um dicionario a partir de uma sequência de key-value pairs.
 */
let names = ["Cagney", "Lacey", "Bensen"]
let dict = Dictionary(uniqueKeysWithValues: zip(1..., names))
dict[2]

/*:
 ### Merging initializer and `merge` method
 
 Especifica como que chaves duplicadas devem ser tratadas quando criando um `Dictionary` a partir de uma sequêcia ou quando incorporando uma sequência à um `Dictionary` já existente.
 */
let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
let letters = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
letters

/*:
 Usar esse construtor ou o método de `merge` pode ser um pouco frustrante quando a `Sequence` em questão for um `Dictionary` já que o tipo dos elementos acabado sendo uma tupla no formato `(key: Key, value: Value)` e os métodos novos esperam uma sequência do tipo `(Key, Value)`, nesse caso  a conversão tem que ser manual. Espera-se que esse problema seja corrigido em builds futuros. Ver [SR-922](https://bugs.swift.org/browse/SR-922) e [SR-4969](https://bugs.swift.org/browse/SR-4969).
 */
let defaults = ["foo": false, "bar": false, "baz": false]
var options = ["foo": true, "bar": false]
// Isso produz um erro de type check: error: generic parameter 'S' could not be inferred
// let mergedOptions = options.merge(defaults) { (old, _) in old }
// Tem que ser feito isso, então:
options.merge(defaults.map { $0 }) { (old, _) in old }
options


/*:
 ### Subscript with default value
 
 Agora pode-se ter um valor default para chaves inexistentes como parâmetor do subscript, fazendo com que o retorno não seja mais opcional.
 */
dict
dict[4, default: "(unknown)"]

/*:
 O que pode ser bem útil caso queira-se mudar um valor usando o subscript:
 */
let source = "how now brown cow"
var frequencies: [Character: Int] = [:]
for c in source {
    frequencies[c, default: 0] += 1
}
frequencies

/*:
 ### Dictionary-specific `map` and `filter`
 
 `filter` agora retorna um `Dictionary` e não um `Array`. Na mesma linha, o novo métdo `mapValues` transforma os valores e preserva a estrutua do `Dictionary`
 */
let filtered = dict.filter {
    $0.key % 2 == 0
}
type(of: filtered)

let mapped = dict.mapValues { value in
    value.uppercased()
}
mapped

/*:
 `Set.filter` agora retorna um `Set` e não um `Array`.
 */
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 }
type(of: filteredSet)

/*:
 ### Grouping a sequence
 
 É bem mais simples agrupar valores em buckets agora. Por exemplo dividir palavras em uma lista de palavras agrupadas pela letra inicial:
 */
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
grouped

/*: [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
