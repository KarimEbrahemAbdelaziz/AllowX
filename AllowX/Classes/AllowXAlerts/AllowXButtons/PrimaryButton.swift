//
//  PrimaryButton.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import UIKit

public class PrimaryButton: UIButton {
    // MARK: - Properties

    private let highlightedAlphValue: CGFloat = 0.8
    private let cornerRadius: CGFloat = 8.0

    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0).withAlphaComponent(highlightedAlphValue)
            } else {
                backgroundColor = UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0)
            }
        }
    }

    public override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0)
            } else {
                backgroundColor = UIColor(red: 178.0 / 255, green: 178.0 / 255, blue: 178.0 / 255, alpha: 1.0)
            }
        }
    }

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupBoxFoodPrimaryButtonStyle()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupBoxFoodPrimaryButtonStyle()
    }

    // MARK: - Private Functions

    private func setupBoxFoodPrimaryButtonStyle() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        backgroundColor = UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0)
        layer.cornerRadius = cornerRadius
    }
}
