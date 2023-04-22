//
//  TitleSubtitle.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation
import UIKit

public protocol TitleSubtitleContainable: ViewContainable {
    func setup(viewModel: TitleSubtitleViewModel)
}


public final class TitleSubtitle: ViewContainer, TitleSubtitleContainable {
    private let title: LabelContainable
    private let subtitle: LabelContainable

    public override init(frame: CGRect) {
        self.title = Label()
        self.subtitle = Label()
        super.init(frame: frame)
        addSubview(title)
        addSubview(subtitle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let titleSize = title.sizeThatFits(size)
        let subtitleSize = subtitle.sizeThatFits(size)
        let width = max(titleSize.width, subtitleSize.width)
        let height = titleSize.height + subtitleSize.height + .verticalOffset
        return CGSize(width: width, height: height)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        title.sizeToFit()
        title.frame.origin = .zero
        subtitle.sizeToFit()
        subtitle.frame.origin = CGPoint(x: 0, y: title.frame.maxY + .verticalOffset)
    }

    public func setup(viewModel: TitleSubtitleViewModel) {
        super.setup(viewModel: viewModel)
        title.setup(viewModel: viewModel.titleViewModel)
        subtitle.setup(viewModel: viewModel.subtitleViewModel)
        setNeedsLayout()
    }

    public override func setup(viewModel: ViewModel) {
        guard let vm = viewModel as? TitleSubtitleViewModel else {
            assertionFailure("wrong vm")
            return
        }
        setup(viewModel: vm)
    }
    
}

private extension CGFloat {
    static let verticalOffset: CGFloat = 8
}
