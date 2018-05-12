extension Color {
    public init(hex: Int, alpha: Float = 1) {
        self = Color(
            redInt: (hex & 0xff0000) >> 16,
            greenInt: (hex & 0x00ff00) >> 8,
            blueInt: hex & 0x0000ff,
            alpha: alpha
        )
    }
    
    public init?(hexString: String, alpha: Double = 1) {
        // TODO: implement me!
        return nil
    }
    
    //    public init?(hex: String, alpha: Float? = nil) {
    //        var hexValue = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    //        guard [3, 4, 6, 8].contains(hexValue.count) else { return nil }
    //
    //        if hexValue.count == 3 {
    //            hexValue.append("F")
    //        }
    //
    //        if hexValue.count == 6 {
    //            hexValue.append("FF")
    //        }
    //
    //        if [3, 4].contains(hexValue.count) {
    //            for (index, char) in hexValue.enumerated() {
    //                let index = hexValue.index(hexValue.startIndex, offsetBy: index * 2)
    //                hexValue.insert(char, at: index)
    //            }
    //        }
    //
    //        guard let normalizedHex = Int(hexValue, radix: 16) else { return nil }
    //
    //        self.init(
    //            red:   Float((normalizedHex >> 24) & 0xFF) / 255,
    //            green: Float((normalizedHex >> 16) & 0xFF) / 255,
    //            blue:  Float((normalizedHex >> 8)  & 0xFF) / 255,
    //            alpha: alpha ?? Float((normalizedHex)  & 0xFF) / 255
    //        )
    //    }
    //
    //    public func toHex(withAlpha: Bool = true) -> String {
    //        let alpha = withAlpha ? String(format: "%02X", Int(rgba.alpha * 255)) : ""
    //        return String(format: "%02X%02X%02X\(alpha)", Int(rgba.red * 255), Int(rgba.green * 255), Int(rgba.blue * 255))
    //    }
    
    public var hex: Int {
        get {
            let red = Int(self.rgb.red   * 255) << 16
            let green = Int(self.rgb.green * 255) << 8
            let blue = Int(self.rgb.blue  * 255)
            
            return red + green + blue
        }
        set {
            self = Color(hex: newValue)
        }
    }
    
    //    public var hexString: String {
    //        get {
    //            return String(format: "#%02lx%02lx%02lx",
    //                          Int(self.rgb.red * 255),
    //                          Int(self.rgb.green * 255),
    //                          Int(self.rgb.blue * 255))
    //        }
    //        set {
    //            self = Color.hexString2rgb(newValue)
    //        }
    //    }
}
