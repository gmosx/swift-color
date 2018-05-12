extension Color: Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        self.red = try container.decode(Float.self)
        self.green = try container.decode(Float.self)
        self.blue = try container.decode(Float.self)
        self.alpha = try container.decode(Float.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(red)
        try container.encode(green)
        try container.encode(blue)
        try container.encode(alpha)
    }
}
