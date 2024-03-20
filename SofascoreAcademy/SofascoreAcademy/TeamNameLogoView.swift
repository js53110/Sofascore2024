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


class TeamNameLogoVeiw: BaseView {
    
    private let teamName: String
    private let teamLogo: String
    
    private let teamNameLabel = UILabel()
    private let teamLogoImageView = UIImageView()

    init(teamName: String, teamLogo: String) {
        self.teamName = teamName
        self.teamLogo = teamLogo
        super.init()
    }
    
    override func addViews() {
        addSubview(teamNameLabel)
        addSubview(teamLogoImageView)
    }

    override func styleViews() {
        teamNameLabel.text = teamName
        teamNameLabel.font = fonts.RobotoRegular14
        teamLogoImageView.image = UIImage(named: teamLogo)
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
