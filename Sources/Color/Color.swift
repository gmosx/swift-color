import Foundation

// https://github.com/dylan/colors <-- really good!
// https://github.com/soffes/Color
// https://gist.github.com/shaps80/cfb444e6bde593a63cb6e5bfcab852aa

// TODO: Add optional name
// TODO: Add ExpressibleByArrayLiteral
// TODO: hex

/// Represents a color value.
public struct Color {
    public typealias RGB = (red: Float, green: Float, blue: Float)
    public typealias RGBA = (red: Float, green: Float, blue: Float, alpha: Float)

    public var red: Float
    public var green: Float
    public var blue: Float
    public var alpha: Float

    public init(red: Float, green: Float, blue: Float, alpha: Float = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    public init(redInt: Int, greenInt: Int, blueInt: Int, alpha: Float = 1) {
        self = Color(
            red: Float(redInt) / 255,
            green: Float(greenInt) / 255,
            blue: Float(blueInt) / 255,
            alpha: alpha
        )
    }
    
    public init(achromatic: Float, alpha: Float = 1) {
        self.init(red: achromatic, green: achromatic, blue: achromatic, alpha: alpha)
    }

    public func with(alpha: Float) -> Color {
        return Color(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: alpha)
    }
    
    public var rgb: RGB {
        return RGB(red: red, green: green, blue: blue)
    }

    public var rgba: RGBA {
        return RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }
}
