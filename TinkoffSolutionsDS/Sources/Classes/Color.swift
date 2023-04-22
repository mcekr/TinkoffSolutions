//
//  Color.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public enum Color {
    case `static`(UIColor)

    var uiColor: UIColor {
        switch self {
        case .static(let color):
            return color
        }
    }
}

public struct ColorToken {
    public static let primary: Color = .static(UIColor(rgb: 0x333333))
    public static let secondary: Color = .static(UIColor(rgb: 0x9299A2))
    public static let buttonBlue: Color = .static(UIColor(rgb: 0x428BF9))
    public static let backgroundColor: Color = .static(.white)
    public static let backgroundColorFlat: Color = .static(UIColor(rgb: 0xF6F7F8))
}


public extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")
       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
