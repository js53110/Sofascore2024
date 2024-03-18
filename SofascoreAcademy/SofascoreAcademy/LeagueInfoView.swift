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

    private let countryName: String
    private let leagueName: String
    private let leagueLogo: String
    private let arrow: String = "pointer"

    private let stackView = UIStackView()
    private let countryNameLabel = UILabel()
    private let leagueNameLabel = UILabel()
    
    private let leagueLogoImageView = UIImageView()
    private let arrowImageView = UIImageView()

    init(countryName: String, leagueName: String, leagueLogo: String) {
        
        self.countryName = countryName
        self.leagueName = leagueName
        self.leagueLogo = leagueLogo
        

        super.init()
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
        countryNameLabel.text = countryName
        countryNameLabel.font = RobotoBold
        
        leagueNameLabel.text = leagueName
        leagueNameLabel.textColor = surfaceLv2
        leagueNameLabel.font = RobotoBold

        leagueLogoImageView.image = UIImage(named: leagueLogo)
        arrowImageView.image = UIImage(named: arrow)
    }

    override func setupConstraints() {
        
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
        arrowImageView.snp.makeConstraints(){
            $0.height.width.equalTo(24)
        }
        
        leagueLogoImageView.snp.makeConstraints {
            $0.width.height.equalTo(32)
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview() 
        }
        
        stackView.snp.makeConstraints() {
            $0.leading.equalTo(leagueLogoImageView.snp.trailing).offset(32)
            $0.centerY.equalToSuperview() 
        }

    }
}
