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
    private let LeagueInfoView: LeagueInfoView = .init(countryName: "Spain", leagueName: "LaLiga", leagueLogo: "leagueLogo")
    
    init(leagueData: Array<matchData>) {
        
        self.leagueData = leagueData
        super.init()
        setupView()
        }
    
    override func addViews() {
        
        addSubview(LeagueInfoView)
    }

    override func setupConstraints() {
        
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
        LeagueInfoView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupView() {
        
        for (index, data) in leagueData.enumerated() {
            let matchView = MatchView(matchId: data.matchId, homeTeam: data.homeTeam, homeTeamLogo: data.homeLogo, awayTeam: data.awayTeam, awayTeamLogo: data.awayLogo, matchStatus: data.status, matchTime: data.timeStamp)
                    
            LeagueInfoView.addSubview(matchView)
                    
            matchView.snp.makeConstraints {
                $0.top.equalToSuperview().offset((index+1) * 56)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(56)
            }
        }
    }
}
