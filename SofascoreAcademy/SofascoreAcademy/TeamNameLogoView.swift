//
//  LeagueNameView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import SnapKit
import UIKit
import SofaAcademic

class TeamNameLogoView: BaseView {
    
    private let teamNameLabel = UILabel()
    private let teamLogoImageView = UIImageView()
    
    func update(teamName: String, teamLogo: String, color: UIColor) {
        teamNameLabel.text = teamName
        teamLogoImageView.image = UIImage(named: teamLogo)
        teamNameLabel.textColor = color
    }

    override func addViews() {
        addSubview(teamNameLabel)
        addSubview(teamLogoImageView)
    }

    override func styleViews() {
        teamNameLabel.font = fonts.RobotoRegular14
        teamLogoImageView.contentMode = .scaleAspectFit
    }

    override func setupConstraints() {
        snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.width.equalTo(216)
        }
        
        teamNameLabel.snp.makeConstraints() {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(teamLogoImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        teamLogoImageView.snp.makeConstraints() {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.width.equalTo(16)
        }
    }
}
