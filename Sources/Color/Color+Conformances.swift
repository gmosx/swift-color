extension Color: CustomStringConvertible {
    public var description: String {
        return hexString
    }
}

extension Color: ExpressibleByStringLiteral {
    public init(extendedGraphemeClusterLiteral value: String) {
        if let color = Color(hexString: value) {
            self = color
        } else {
            fatalError("Invalid color hex-string")
        }
    }

    public init(unicodeScalarLiteral value: String) {
        if let color = Color(hexString: value) {
            self = color
        } else {
            fatalError("Invalid color hex-string")
        }
    }

    public init(stringLiteral value: String) {
        if let color = Color(hexString: value) {
            self = color
        } else {
            fatalError("Invalid color hex-string")
        }
    }
}
