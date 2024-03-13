//
//  LeagueView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import UIKit

class LeagueView: UIView {
    
    let leagueData: Array<matchData>
    
    init(leagueData: Array<matchData>) {
        self.leagueData = leagueData
        super.init(frame: .zero)
            setupView()
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let leagueNameView:LeagueNameView = .init(countryName: "Spain", leagueName: "LaLiga", leagueLogo: "leagueLogo")
        addSubview(leagueNameView)
        
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
        leagueNameView.snp.makeConstraints() {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview() // Match leading and trailing edges of parent
        }
        for (index, data) in leagueData.enumerated() {
            let matchView = MatchView(homeTeam: data.homeTeam, homeTeamLogo: data.homeLogo, homeTeamScore: data.homeTeamScore, awayTeam: data.awayTeam, awayTeamLogo: data.awayLogo, awayTeamScore: data.awayTeamScore, matchStatus: data.status, matchTime: data.timeStamp)
                    
            addSubview(matchView)
                    
            matchView.snp.makeConstraints {
                $0.top.equalToSuperview().offset((index+1) * 56) // Adjust vertical spacing
                $0.leading.trailing.equalToSuperview() // Match leading and trailing edges of parent
                $0.height.equalTo(56) // Set height to 50 points
            }
        }
    }
}
