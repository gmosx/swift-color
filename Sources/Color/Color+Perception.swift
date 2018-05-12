extension Color {
    /// Returns true if the color is considered visually dark, false otherwise
    public var isDark: Bool {
        return (0.2126 * red + 0.7152 * green + 0.0722 * blue) < 0.5
    }
    
    /// Returns a new color value that is the inverse of this color
    public func inverted() -> Color {
        return Color(red: 1 - rgba.red, green: 1 - rgba.green, blue: 1 - rgba.blue, alpha: rgba.alpha)
    }
}
