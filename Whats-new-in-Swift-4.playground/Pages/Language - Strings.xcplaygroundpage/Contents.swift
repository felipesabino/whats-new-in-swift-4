/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)
 
 ## Strings
 
 ### Contexto
 
 Unicode é... complicado
 
 */

let one = "\u{e9}" // é
let two = "\u{65}\u{301}" // e + ´ = é

one == two // false on Swift 3

/*:
 ### Unicode 9
 
 Swift 4 vai suportar Unicode 9, corrigindo [alguns problemas de clusterização em emojos modernos][Emoji 4.0]. o `count` para todos os caracteres abaixo agora é `1`, omo deveriam ser:
 
 [Emoji 4.0]: https://oleb.net/blog/2016/12/emoji-4-0/
 */
"👧🏽".count // pessoa + tom de pele
"👨‍👩‍👧‍👦".count // familia com 4 integrantes
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻"
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻".count // familia + tom de pele
"👩🏻‍🚒".count // pessoa + tom de pele + profissão

/*:

 ### String is a `Collection` again

 Spec: [SE-0163][SE-0163] 
 
 `String` é uma a `Collection` novamente (como era no Swift 1.x).
 
 Atenção: SE-0163 ainda não está completamente implementado e é provável que ainda terão mudanças.

 [SE-0163]: https://github.com/apple/swift-evolution/blob/master/proposals/0163-string-revision-1.md "Swift Evolution Proposal SE-0163: String Revision: Collection Conformance, C Interop, Transcoding"
 */
let greeting = "Hello, 😜!"
// No need to drill down to .characters
greeting.count
for char in greeting {
    print(char)
}



/*:
 
 ### Substring não é uma cópia da String
 
 ```Swift
 let hugeString = downloadHugeString()
 let small = hugeString[..<5]
 
 // `small` agora guarda uma referêcia para `hugeString`
 
 self.someUIComponent.text = String(small)
 
 // ☝️ somente agora é criada uma cópia com o subset da String usada por `small`
 
 
 ```
 
 
 */

/*:
 ### `String` and `Substring` implementam `StringProtocol`
 
 Quase todas as funcionalidades de String agora estão em `StringProtocol`, assim `String` e `Substring` são praticamente os mesmos.
 */
let comma = greeting.index(of: ",")!
let substring = greeting[..<comma]
type(of: substring)
// String API can be called on Substring
print(substring.uppercased())

//: E agora você pode usar `.split` direto na String, sem precisar acessar `.characters`

let words = "Lorem ipsum dolor sit amet".split(separator: " ")

/*:
 
 ### Multi-line string literals
 
 Spec: [SE-0168][SE-0168]
 
 Agora string multi-linha podem ser usadas com aspas triplas (`"""`).
 
 E dentro da string você não precis fazer _escape_ de aspas, facilitando manipulação de textos cmo HTML e JSON.
 
 A identação das aspas triplas delimitam quanto espaço em branco será removido do começo de cada linha.
 
 Proposta implementada pela [comunidade open source \o/](https://github.com/apple/swift/pull/8813)
 
 [SE-0168]: https://github.com/apple/swift-evolution/blob/master/proposals/0168-multi-line-string-literals.md "Swift Evolution Proposal SE-0168: Multi-Line String Literals"
 */

let multilineStringSwift3 = "Isso é uma String multi-linha.\n Não precisa fazer escape das \"aspas\"\nThis is a multi-line string.\nA identação do delimitador final informa\n    quanto espaço em branco será removido."
print(multilineStringSwift3)

let multilineString = """
    Isso é uma String multi-linha.
    Não precisa fazer escape das "aspas"
    This is a multi-line string.
    A identação do delimitador final informa
        quanto espaço em branco será removido.
    """
print(multilineString)




/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
