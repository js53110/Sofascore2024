//
//  LeagueNameView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import SnapKit
import UIKit


class TeamLabel: UIView {
    
    let teamName: String
    let teamLogo: String
    
    let teamNameLabel = UILabel()
    let teamLogoImageView = UIImageView()

    init(teamName: String, teamLogo: String) {
        self.teamName = teamName
        self.teamLogo = teamLogo
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(teamNameLabel)
        addSubview(teamLogoImageView)
        
        teamNameLabel.text = teamName
        teamNameLabel.font = RobotoRegular14
        teamLogoImageView.image = UIImage(named: teamLogo)
        
        snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.width.equalTo(216)
        }
        
        teamNameLabel.snp.makeConstraints() {
            $0.top.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(24)
        }
        
        teamLogoImageView.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.height.width.equalTo(16)
        }
    }
}
