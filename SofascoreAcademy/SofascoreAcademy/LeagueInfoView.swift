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

class LeagueInfoView: BaseView {
 
    private var arrow: String = "pointer"

    private let stackView = UIStackView()
    private let countryNameLabel = UILabel()
    private let leagueNameLabel = UILabel()
    
    private let leagueLogoImageView = UIImageView()
    private let arrowImageView = UIImageView()
    
    func update(countryName: String, leagueName: String, leagueLogo: String) {
        countryNameLabel.text = countryName
        leagueNameLabel.text = leagueName
        leagueLogoImageView.image = UIImage(named: leagueLogo)
    }
    
    override func addViews() {
        addSubview(stackView)
        addSubview(leagueLogoImageView)
        stackView.addArrangedSubview(countryNameLabel)
        stackView.addArrangedSubview(arrowImageView)
        stackView.addArrangedSubview(leagueNameLabel)
    }

    override func styleViews() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        countryNameLabel.font = fonts.RobotoBold
        
        leagueNameLabel.textColor = colors.surfaceLv2
        leagueNameLabel.font = fonts.RobotoBold
        arrowImageView.image = UIImage(named: arrow)
        leagueLogoImageView.contentMode = .scaleAspectFit

    }

    override func setupConstraints() {
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
        arrowImageView.snp.makeConstraints(){
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        leagueLogoImageView.snp.makeConstraints {
            $0.width.height.equalTo(32)
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        stackView.snp.makeConstraints() {
            $0.leading.equalTo(leagueLogoImageView.snp.trailing).offset(32)
            $0.centerY.equalToSuperview() 
        }
    }
}
