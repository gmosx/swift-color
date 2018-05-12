// http://en.wikipedia.org/wiki/HSL_color_space
// https://gist.github.com/mjackson/5311256
// https://github.com/dylan/colors/blob/master/Sources/Color%2BConversion.swift

public extension Color {
    public typealias HSL = (hue: Float, saturation: Float, lightness: Float)
    public typealias HSV = (hue: Float, saturation: Float, value: Float)

    public init(hue: Float, saturation: Float, lightness: Float, alpha: Float = 1) {
        let h = hue / 360

        if saturation == 0 {
            self = Color(red: lightness, green: lightness, blue: lightness, alpha: alpha)
        } else {
            let temp2 = lightness < 0.5 ? lightness * (1 + saturation) : lightness + saturation - lightness * saturation
            let temp1 = 2 * lightness - temp2

            func normalize(_ c: Float) -> Float {
                return c < 1 / 6 ? temp1 + (temp2 - temp1) * 6 * c : c < 1 / 2 ? temp2 : c < 2 / 3 ? temp1 + (temp2 - temp1) * 6 * (2 / 3 - c) : temp1
            }

            let r = normalize((h + 1 / 3).truncatingRemainder(dividingBy: 1))
            let g = normalize(h)
            let b = normalize((h + 2 / 3).truncatingRemainder(dividingBy: 1))

            self = Color(red: r, green: g, blue: b, alpha: alpha)
        }
    }

    public var hsl: HSL {
        let min = Swift.min(red, green, blue)
        let max = Swift.max(red, green, blue)
        let chroma = max - min

        var h: Float = 0
        var s: Float = 0
        var l: Float = 0

        if max == min {
            h = 0
        } else if max == red {
            h = (green - blue) / chroma
        } else if max == green {
            h = 2 + (blue - red) / chroma
        } else if max == blue {
            h = 4 + (red - green) / chroma
        }

        h = Swift.min(h * 60, 360)

        if h > 360 {
            h -= 360
        }

        if h < 0 {
            h += 360
        }

        l = (min + max) / 2

        if max == min {
            s = 0
        } else if l <= 0.5 {
            s = chroma / (max + min)
        } else {
            s = chroma / (2 - max - min)
        }

        return HSL(hue: h, saturation: s, lightness: l)
    }

    public var hsv: HSV {
        let min = Swift.min(red, green, blue)
        let max = Swift.max(red, green, blue)
        let chroma = max - min

        var h: Float = 0
        var s: Float = 0
        var v: Float = 0

        if max == min {
            s = 0
        } else {
            s = chroma / max
        }

        if max == min {
            h = 0
        } else if max == red {
            h = (green - blue) / chroma
        } else if max == green {
            h = 2 + (blue - red) / chroma
        } else if max == blue {
            h = 4 + (red - green) / chroma
        }

        h = Swift.min(h * 60, 360)

        if h < 0 {
            h += 360
        }

        v = max

        return HSV(hue: h, saturation: s, value: v)
    }

    public var chroma: Float {
        let min = Swift.min(red, green, blue)
        let max = Swift.max(red, green, blue)

        return max - min
    }

    public var luma: Float {
        return (0.299 * red) + (0.587 * green) + (0.114 * blue)
    }
}
