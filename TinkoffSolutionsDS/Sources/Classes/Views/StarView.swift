//
//  File.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public final class StarView: ViewContainer {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AvatarIcon")
        return imageView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = bounds.height / 2
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return .starViewSize
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }

}

private extension CGSize {
    static let starViewSize: CGSize = .init(width: 16, height: 16)
}
