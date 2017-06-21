/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## Archival and serialization

 Spec: [SE-0166: Swift Archival & Serialization][SE-0166] 
 
 Esse spec define um modo de qualquer tipo (classes, structs e enums) de se armazenar e serializar ao implementar o protocol `Codable`.
 
 Em vários casos adicionar o protocolo `Codable` vai ser tudo que será necessário jea que o compilador vai gerar uma implementação default se todos os membros do seu tipo forem implementarem também o protocolo `Codable`. Você pode fazer override do comportamento padrão para customizar como essa serialização ocorre.
 
 [SE-0166]: https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md "Swift Evolution Proposal SE-0166: Swift Archival & Serialization"

 */
// Faz com que um tipo e todos seus membros sejam serializáveis ao implementar `Codable`
struct Card: Codable {
    enum Suit: String, Codable {
        case clubs, spades, hearts, diamonds
    }

    enum Rank: Int, Codable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }

    var suit: Suit
    var rank: Rank
}

let hand = [Card(suit: .clubs, rank: .ace), Card(suit: .hearts, rank: .queen)]

/*:
 ### Encoding
 
 Ao ter um valor que é `Codable`, você precisa passar um encoder para informar como arquivá-lo.
 
 Você pode criar seus próprios encoders e decoders para usar toda a infraestrutura do Framework `Codable`. Alguns encoders são padrão no Swift como  JSON (`JSONEncoder` e `JSONDecoder`) e property lists (`PropertyListEncoder` e `PropertyListDecoder`), definidos em  [SE-0167][SE-0167].
 
 aka ⚰️ [Object-Mapper](https://github.com/Hearst-DD/ObjectMapper) e [afins](https://medium.com/@alexcamill/thoughts-about-swift-json-mapping-libraries-why-i-will-stop-using-objectmapper-42f3684c7b0e)

 [SE-0167]: https://github.com/apple/swift-evolution/blob/master/proposals/0167-swift-encoders.md "Swift Evolution Proposal SE-0167: Swift Encoders"
 */
import Foundation

var encoder = JSONEncoder()

// Properties oferecidas pelo JSONEncoder para customizar o output
encoder.dataEncodingStrategy
encoder.dateEncodingStrategy
encoder.nonConformingFloatEncodingStrategy
encoder.outputFormatting
encoder.userInfo

let jsonData = try encoder.encode(hand)
String(data: jsonData, encoding: .utf8)

/*:
 ### Decoding
 */
let decoder = JSONDecoder()
let decoded = try decoder.decode([Card].self, from: jsonData)

/*: [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
