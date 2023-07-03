//
//  BlockerRecordingView.swift
//  Prevent Screenshot POC
//
//  Created by Ramy Sabry on 03/07/2023.
//

import UIKit

final class BlockerRecordingView: UIView {
    @IBOutlet private var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed("BlockerRecordingView", owner: self)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
