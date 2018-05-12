extension Color: CustomStringConvertible {
    public var description: String {
        // let color = literalRGBA()
        // return "(\(color.red), \(color.green), \(color.blue), \(rgba.alpha)) \(toHex(withAlpha: true))"
        return "#\(toHex(withAlpha: false))"
    }
}

extension Color: ExpressibleByStringLiteral {
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(hex: value)!
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(hex: value)!
    }
    
    public init(stringLiteral value: String) {
        self.init(hex: value)!
    }
}
