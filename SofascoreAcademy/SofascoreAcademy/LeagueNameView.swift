//
//  LeagueNameView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import SnapKit
import UIKit


class LeagueNameView: UIView {

    let countryName:String
    let leagueName:String
    let leagueLogo:String
    let arrow:String = "pointer"
    
    private let countryNameLabel = UILabel()
    private let leagueNameLabel = UILabel()
    
    private let leagueLogoImageView = UIImageView()
    private let arrowImageView = UIImageView()

    init(countryName: String, leagueName: String, leagueLogo: String) {
        self.countryName = countryName
        self.leagueName = leagueName
        self.leagueLogo = leagueLogo
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        countryNameLabel.text = countryName
        countryNameLabel.font = RobotoBold
        leagueNameLabel.text = leagueName
        leagueNameLabel.textColor = lightGrey
        leagueNameLabel.font = RobotoBold

        leagueLogoImageView.image = UIImage(named: leagueLogo)
        arrowImageView.image = UIImage(named: arrow
        )
  
        addSubview(leagueLogoImageView)
        
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
        arrowImageView.snp.makeConstraints(){
            $0.height.width.equalTo(24)
        }
        
        leagueLogoImageView.snp.makeConstraints {
            $0.width.height.equalTo(32) // Set size to 32x32 points
            $0.leading.equalToSuperview().offset(16) // 16 points from the left edge of superview
            $0.centerY.equalToSuperview() // Center vertically in superview
        }
        
        let stackView = UIStackView(arrangedSubviews: [countryNameLabel, arrowImageView, leagueNameLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.snp.makeConstraints(){
            $0.leading.equalToSuperview().offset(80)
            $0.centerY.equalToSuperview() // Center vertically in superview
        }
    }
}
