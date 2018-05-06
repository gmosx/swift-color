// http://en.wikipedia.org/wiki/HSL_color_space
// https://gist.github.com/mjackson/5311256

public extension Color {
    public typealias HSL = (hue: Float, saturation: Float, lightness: Float)
    public typealias HSLA = (hue: Float, saturation: Float, lightness: Float, alpha: Float)

    public var hsla: HSLA {
//        r /= 255, g /= 255, b /= 255;
//
//        var max = Math.max(r, g, b), min = Math.min(r, g, b);
//        var h, s, l = (max + min) / 2;
//
//        if (max == min) {
//            h = s = 0; // achromatic
//        } else {
//            var d = max - min;
//            s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
//
//            switch (max) {
//            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
//            case g: h = (b - r) / d + 2; break;
//            case b: h = (r - g) / d + 4; break;
//            }
//
//            h /= 6;
//        }
//
//        return [ h, s, l ];

        let (red, green, blue, alpha) = rgba

        let maxValue = max(red, green, blue)
        let minValue = min(red, green, blue)

        let hue: Float
        let saturation: Float
        let lightness = (maxValue + minValue) / 2

        if maxValue == minValue {
            // Achromatic
            hue = 0.0
            saturation = 0.0
        } else {
            let delta = maxValue - minValue

            saturation = lightness > 0.5 ? delta / (2 - maxValue - minValue) : d / (maxValue + minValue)

            switch maxValue {
            case red:
                hue = (green - blue) / delta + (green < blue ? 6 : 0)

            case green:
                hue = (blue - red) / delta + 2

            case green:
                hue = (red - green) / delta + 4

            default:
                fatalError()
            }
        }

        return (hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)
    }
}
