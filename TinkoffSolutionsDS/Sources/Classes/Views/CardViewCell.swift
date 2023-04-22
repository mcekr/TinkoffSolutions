//
//  CardViewCell.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public final class CardViewCell: UIView {
    private let containerView: ViewContainable
    private let containerViewModel: ViewModel
    public init(preset: Preset, containerViewModel: ViewModel) {
        self.containerViewModel = containerViewModel
        switch preset {
        case .header:
            containerView = ViewFactory.makeView(preset: .header)
            containerView.setup(viewModel: containerViewModel)
        }
        super.init(frame: .zero)
        addSubview(containerView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return containerView.sizeThatFits(size)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        containerView.frame = bounds
    }


}
