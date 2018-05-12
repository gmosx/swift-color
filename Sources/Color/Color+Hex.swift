extension Color {
    public init(hex: Int, alpha: Float = 1) {
        self = Color(
            redInt: (hex & 0xff0000) >> 16,
            greenInt: (hex & 0x00ff00) >> 8,
            blueInt: hex & 0x0000ff,
            alpha: alpha
        )
    }

    public init?(hexString: String, alpha: Float = 1.0) {
            var hexValue = hexString.hasPrefix("#") ? String(hexString.dropFirst()) : hexString

        guard [3, 4, 6, 8].contains(hexValue.count) else {
            return nil
        }

        if hexValue.count == 3 {
            hexValue.append("F")
        }

        if hexValue.count == 6 {
            hexValue.append("FF")
        }

        if [3, 4].contains(hexValue.count) {
            for (index, char) in hexValue.enumerated() {
                let index = hexValue.index(hexValue.startIndex, offsetBy: index * 2)
                hexValue.insert(char, at: index)
            }
        }

        guard let normalizedHex = Int(hexValue, radix: 16) else {
            return nil
        }

        self.init(
            redInt: (normalizedHex >> 24) & 0xFF,
            greenInt: (normalizedHex >> 16) & 0xFF,
            blueInt: (normalizedHex >> 8)  & 0xFF,
            alpha: alpha
        )
    }

    public var hex: Int {
        let red = Int(self.rgb.red   * 255) << 16
        let green = Int(self.rgb.green * 255) << 8
        let blue = Int(self.rgb.blue  * 255)

        return red + green + blue
    }

    public var hexString: String {
        return String(
            format: "#%02lx%02lx%02lx",
            Int(self.red * 255),
            Int(self.green * 255),
            Int(self.blue * 255)
        )
    }
}
