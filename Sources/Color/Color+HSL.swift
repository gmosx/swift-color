// http://en.wikipedia.org/wiki/HSL_color_space
// https://gist.github.com/mjackson/5311256

//fileprivate func hueToRGB(p: Float, q: Float, t: Float) -> Float {
//    if t < 0 {
//        t += 1
//    }
//
//    if t > 1 {
//        t -= 1
//    }
//
//    if t < 1/6 {
//        return p + (q - p) * 6 * t
//    }
//
//    if t < (1/2) {
//        return q
//    }
//
//    if t < (2/3) {
//        return p + (q - p) * (2/3 - t) * 6
//    }
//
//    return p
//}

public extension Color {
    public typealias HSL = (hue: Float, saturation: Float, lightness: Float)
    public typealias HSLA = (hue: Float, saturation: Float, lightness: Float, alpha: Float)

//    public init(hue: Float, saturation: Float, lightness: Float, alpha: Float = 1) {
////        var r, g, b;
////
////        if (s == 0) {
////        r = g = b = l; // achromatic
////        } else {
////        function hue2rgb(p, q, t) {
////        if (t < 0) t += 1;
////        if (t > 1) t -= 1;
////        if (t < 1/6) return p + (q - p) * 6 * t;
////        if (t < 1/2) return q;
////        if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
////        return p;
////        }
////
////        var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
////        var p = 2 * l - q;
////
////        r = hue2rgb(p, q, h + 1/3);
////        g = hue2rgb(p, q, h);
////        b = hue2rgb(p, q, h - 1/3);
////        }
////
////        return [ r * 255, g * 255, b * 255 ];
//
//        self.alpha = alpha
//
//        if saturation == 0 {
//            self.red = 1
//            self.green = 1
//            self.blue = 1
//        } else {
//            var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
//            var p = 2 * l - q;
//        }
//    }

    // L = (M + m) / 2
    public var hsl: HSL {
        let maximum = max(red, green, blue)
        let minimum = min(red, green, blue)
        let chroma = maximum - minimum

        let hue: Float
        let saturation: Float
        let lightness: Float

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

//        let normalizedHue = hue / 60
//        let scaledHue = normalizedHue * 360
        
        return (hue: hue * 60, saturation: saturation, lightness: lightness) // returns hue in degrees [0..360]
    }
    
    public var hsla: HSLA {
        let tripplet = self.hsl
        return (hue: tripplet.hue, saturation: tripplet.saturation, lightness: tripplet.lightness, alpha: rgba.alpha)
    }

    public var hue: Float {
        return 1 // TODO: implement me!
    }

    public var saturation: Float {
        return 1 // TODO: implement me!
    }

    public var lightness: Float {
        return 1 // TODO: implement me!
    }

    public var luma: Float {
        return (0.299 * red) + (0.587 * green) + (0.114 * blue)
    }
    
    // TODO: move isDark here?
    // TODO: add isLight
}
