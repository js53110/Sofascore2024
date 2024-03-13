//
//  LeagueNameView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import SnapKit
import UIKit

class ScoreLabel: UIView {
    
    let score: Int
    let matchStatus: matchStatus
    let scoreLabel = UILabel()
    let textColor: UIColor

    init(score: Int, matchStatus: matchStatus) {
        self.score = score
        self.matchStatus = matchStatus
        switch matchStatus {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let scoreToString = String(score)
        
        scoreLabel.text = String(scoreToString)
        scoreLabel.textColor = textColor
        scoreLabel.font = RobotoRegular14

        addSubview(scoreLabel)
        
        snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.width.equalTo(32)
        }
        
        scoreLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}
