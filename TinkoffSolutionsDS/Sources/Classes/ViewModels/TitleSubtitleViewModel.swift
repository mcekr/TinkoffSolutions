//
//  TitleSubtitleViewModel.swift
//  
//
//  Created by Protasov Pavel Sergeevich on 22.04.2023.
//

import Foundation

public protocol TitleSubtitleViewModel: ViewModel {
    var titleViewModel: LabelViewModel { get }
    var subtitleViewModel: LabelViewModel { get }
}

public final class TitleSubtitleViewModelImpl: TitleSubtitleViewModel {

    public let titleViewModel: LabelViewModel
    public let subtitleViewModel: LabelViewModel
    public let isFlat: Bool

    public init(titleViewModel: LabelViewModel, subtitleViewModel: LabelViewModel, isFlat: Bool) {
        self.titleViewModel = titleViewModel
        self.subtitleViewModel = subtitleViewModel
        self.isFlat = isFlat
    }
}
