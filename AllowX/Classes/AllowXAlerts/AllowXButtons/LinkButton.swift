//
//  LinkButton.swift
//  AllowX
//
//  Created by KarimEbrahem on 8/1/20.
//

import Foundation
import UIKit

public class LinkButton: UIButton {
    // MARK: - Properties

    private let highlightedAlphValue: CGFloat = 0.8

    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                setTitleColor(UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0).withAlphaComponent(highlightedAlphValue), for: .normal)
            } else {
                setTitleColor(UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0), for: .normal)
            }
        }
    }

    public override var isEnabled: Bool {
        didSet {
            if isEnabled {
                setTitleColor(UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0), for: .normal)
            } else {
                setTitleColor(UIColor(red: 178.0 / 255, green: 178.0 / 255, blue: 178.0 / 255, alpha: 1.0), for: .normal)
            }
        }
    }

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupBoxFoodLinkButtonStyle()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupBoxFoodLinkButtonStyle()
    }

    // MARK: - Private Functions

    private func setupBoxFoodLinkButtonStyle() {
        setTitleColor(UIColor(red: 255.0 / 255, green: 94.0 / 255, blue: 84.0 / 255, alpha: 1.0), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        backgroundColor = .white
    }
}
