public enum ColorSpace {
    case rgb
    case hsl
    case hsv
    case cmyk
    case xyz
    case lab
    
    public var rank: Int {
        switch self {
        case .rgb, .hsl, .hsv, .xyz, .lab:
            return 3
        
        case .cmyk:
            return 4
        }
    }
}
