// #if os(iOS)
//     import UIKit
//     import CoreGraphics
//
//     extension Color {
//         public init?(systemColor: UIColor?) {
//             guard let systemColor = systemColor else { return nil }
//             self.init(cgColor: systemColor.cgColor)
//         }
//
//         public var systemColor: UIColor {
//             return UIColor(cgColor: cgColor)
//         }
//     }
//
//     extension Color {
//         public init?(cgColor: CGColor) {
//             guard let components = cgColor.components else { return nil }
//             let red, green, blue, alpha: Float
//
//             if components.count == 2 {
//                 red = Float(components[0])
//                 green = Float(components[0])
//                 blue = Float(components[0])
//                 alpha = Float(components[1])
//             } else {
//                 red = Float(components[0])
//                 green = Float(components[1])
//                 blue = Float(components[2])
//                 alpha = Float(components[3])
//             }
//
//             self.init(red: red, green: green, blue: blue, alpha: alpha)
//         }
//
//         /// Returns the CGColor representation of this color
//         public var cgColor: CGColor {
//             return CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(),
//                            components: [CGFloat(rgba.red), CGFloat(rgba.green), CGFloat(rgba.blue), CGFloat(rgba.alpha)])!
//         }
//     }
// #endif
