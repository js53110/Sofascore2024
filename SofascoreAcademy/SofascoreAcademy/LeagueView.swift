//
//  LeagueView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import UIKit
import SofaAcademic

class LeagueView: BaseView {
    
    private let leagueData: Array<matchData>
    private let leagueNameView:LeagueNameView = .init(countryName: "Spain", leagueName: "LaLiga", leagueLogo: "leagueLogo")
    
    init(leagueData: Array<matchData>) {
        
        self.leagueData = leagueData
        super.init()
        setupView()
        }
    
    override func addViews() {
        
        addSubview(leagueNameView)
    }

    override func setupConstraints() {
        
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
        leagueNameView.snp.makeConstraints() {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setupView() {
        
        for (index, data) in leagueData.enumerated() {
            let matchView = MatchView(homeTeam: data.homeTeam, homeTeamLogo: data.homeLogo, homeTeamScore: data.homeTeamScore, awayTeam: data.awayTeam, awayTeamLogo: data.awayLogo, awayTeamScore: data.awayTeamScore, matchStatus: data.status, matchTime: data.timeStamp)
                    
            addSubview(matchView)
                    
            matchView.snp.makeConstraints {
                $0.top.equalToSuperview().offset((index+1) * 56)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(56)
            }
        }
    }
}
