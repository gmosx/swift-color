// http://en.wikipedia.org/wiki/HSL_color_space
// https://gist.github.com/mjackson/5311256

public extension Color {
    public typealias HSL = (hue: Float, saturation: Float, lightness: Float)
    public typealias HSLA = (hue: Float, saturation: Float, lightness: Float, alpha: Float)

//    public init(hue: Float, saturation: Float, lightness: Float, alpha: Float = 1) {
//    }

    // L = (M + m) / 2
    public var hsla: HSLA {
        let (red, green, blue, alpha) = rgba

        let maximum = max(red, green, blue)
        let minimum = min(red, green, blue)
        let chroma = maximum - minimum

        let hue: Float
        let saturation: Float
        let lightness: Float

        print(maximum, minimum, red, green, blue)
        lightness = (maximum + minimum) / 2

        if chroma == 0 {
            hue = 0.0
            saturation = 0.0
        } else {
            saturation = lightness > 0.5 ? chroma / (2 - maximum - minimum) : chroma / (maximum + minimum)

            switch maximum {
            case red:
                hue = (green - blue) / chroma + (green < blue ? 6 : 0)

            case green:
                hue = (blue - red) / chroma + 2

            case green:
                hue = (red - green) / chroma + 4

            default:
                fatalError()
            }
        }

        return (hue: hue / 6, saturation: saturation, lightness: lightness, alpha: alpha)
    }

    public var luma: Float {
        let (red, green, blue, _) = rgba
        return (0.299 * red) + (0.587 * green) + (0.114 * blue)
    }
}
