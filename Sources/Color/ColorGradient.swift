// TODO: Linear / Radial gradients

public struct ColorGradient { // TODO: consider renaming to `ColorStop` like CSS
    /// Defines a point in the gradient range.
    /// Use the color's alpha channel if you need to play with opacity.
    public struct Stop {
        public let fraction: Double // TODO: consider renaming to `offset` like SVG
        public let color: Color

        public init(fraction: Double, color: Color) {
            self.fraction = fraction
            self.color = color
        }
    }

    public let stops: [Stop]

    public init(stops: [Stop]) {
        self.stops = stops
    }
}
