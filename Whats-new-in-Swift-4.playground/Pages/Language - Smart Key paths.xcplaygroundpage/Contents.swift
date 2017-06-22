/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## Smart key paths
 
 Spec: [SE-0161][SE-0161]

 Diferente dos keypaths no Cocoa, no Swift eles são fortemente tipados.

 [SE-0161]: https://github.com/apple/swift-evolution/blob/master/proposals/0161-key-paths.md "Swift Evolution Proposal SE-0161: Smart KeyPaths: Better Key-Value Coding for Swift"
 */
struct Person {
    var name: String
}

struct Book {
    var title: String
    var authors: [Person]
    var primaryAuthor: Person {
        return authors.first!
    }
}

// populando com alguns dados:
let abelson = Person(name: "Harold Abelson")
let sussman = Person(name: "Gerald Jay Sussman")
let sicp = Book(title: "Structure and Interpretation of Computer Programs", authors: [abelson, sussman])

/*:
 
 Key paths são formados começando no tipo raiz e em seguida navegando pela combinação de propriedades e nomes dos subscripts.
 
 Começa-se a escrever os key paths com uma barra invertida: `\Book.title`. Cada tipo agora automaticamente possui um subscript `[keyPath: …]` usado para que se obtenha ou modifique um valor do key path em questão.
 */
sicp[keyPath: \Book.title]
// Key paths can to drill down and work for computed properties
sicp[keyPath: \Book.primaryAuthor.name]

/*:
 Key paths são objetos que podem ser guardados e modificados. Por exemplo, você pode adicionar partes novas no key path para ir mais a fundo nas definições do tipo.
 */
let authorKeyPath = \Book.primaryAuthor
type(of: authorKeyPath)
let nameKeyPath = authorKeyPath.appending(path: \.name) // you can omit the type name if the compiler can infer it
sicp[keyPath: nameKeyPath]

/*:
 
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
