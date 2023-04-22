//
//  TextStyle.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public enum TextStyle {
    case h1
    case h2
    case body
    case bodyBold
    case description

    var font: UIFont {
        switch self {
        case .h1:
            return UIFont.boldSystemFont(ofSize: 20)
        case .h2:
            return UIFont.systemFont(ofSize: 13)
        case .body:
            return UIFont.systemFont(ofSize: 17)
        case .bodyBold:
            return UIFont.boldSystemFont(ofSize: 15)
        case .description:
            return UIFont.systemFont(ofSize: 13)
        }
    }
}
