//
//  Data.swift
//  SofascoreAcademy
//
//  Created by Akademija on 18.03.2024..
//

import Foundation

enum matchStatus {
    
    case upcoming
    case inProgress
    case finished
}

struct matchData{
    
    let matchId: Int
    let homeTeam: String
    let awayTeam: String
    let homeLogo: String
    let awayLogo: String
    let status: matchStatus
    let timeStamp: TimeInterval
    let homeTeamScore: Int?
    let awayTeamScore: Int?
}

let matchData1 = matchData(matchId: 1, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .finished, timeStamp: 1710331200, homeTeamScore: 1, awayTeamScore: 2)

let matchData2 = matchData(matchId: 2, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .inProgress, timeStamp: 1710342000, homeTeamScore: 0, awayTeamScore: 1)

let matchData3 = matchData(matchId: 3, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710349200, homeTeamScore: nil, awayTeamScore: nil)

let matchData4 = matchData(matchId: 4, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710354600, homeTeamScore: nil, awayTeamScore: nil)

let leagueData: Array<matchData> = [matchData1, matchData2, matchData3, matchData4]
