extension Color {
    public func lighter(by fraction: Float) -> Color {
        guard fraction > 0 else {
            return self
        }

        let hsl = self.hsl
        let coefficient = 1 + fraction

        return Color(
            hue: hsl.hue,
            saturation: hsl.saturation,
            lightness: hsl.lightness * coefficient, // TODO: add max here?
            alpha: alpha
        )
    }

    public func darker(by fraction: Float) -> Color {
        guard fraction > 0 else {
            return self
        }

        let hsl = self.hsl
        let coefficient = max(0, 1 - fraction)

        return Color(
            hue: hsl.hue,
            saturation: hsl.saturation,
            lightness: hsl.lightness * coefficient,
            alpha: alpha
        )
    }
}
