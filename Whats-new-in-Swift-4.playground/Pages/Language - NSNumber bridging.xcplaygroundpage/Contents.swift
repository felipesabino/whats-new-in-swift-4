/*:
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next)

 ## `NSNumber` bridging

 Spec: [SE-0170][SE-0170] 
 
 Corrigidos alguns problemas perigosos de floating number no tratamento de NSNumber x Swift number
 
 [SE-0170]: https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md "Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types"
 */
import Foundation

let n = NSNumber(value: UInt32(543))
let v = n as? Int8 // nil in Swift 4. Isso seria 31 no Swift 3, já que 543 % 2^8 = 31

/*:
 
 [Índice](Table%20of%20contents) • [Página anterior](@previous) • [Próxima página](@next) */
