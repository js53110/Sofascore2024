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

struct LeagueInfo {
    let countryName: String
    let leagueName: String
    let leagueLogo: String
    let matches: [matchData]
}

let matchData1 = matchData(matchId: 1, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .finished, timeStamp: 1710331200, homeTeamScore: 1, awayTeamScore: 2)

let matchData2 = matchData(matchId: 2, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .inProgress, timeStamp: 1710342000, homeTeamScore: 0, awayTeamScore: 1)

let matchData3 = matchData(matchId: 3, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710349200, homeTeamScore: nil, awayTeamScore: nil)

let matchData4 = matchData(matchId: 4, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710354600, homeTeamScore: nil, awayTeamScore: nil)

let matchData5 = matchData(matchId: 1, homeTeam: "Bayern Munich", awayTeam: "RB Leipzig", homeLogo: "bayernLogo", awayLogo: "leipzigLogo", status: .finished, timeStamp: 1710331200, homeTeamScore: 1, awayTeamScore: 2)

let matchData6 = matchData(matchId: 2, homeTeam: "Bayern Munich", awayTeam: "RB Leipzig", homeLogo: "bayernLogo", awayLogo: "leipzigLogo", status: .inProgress, timeStamp: 1710342000, homeTeamScore: 0, awayTeamScore: 1)

let matchData7 = matchData(matchId: 3, homeTeam: "Bayern Munich", awayTeam: "RB Leipzig", homeLogo: "bayernLogo", awayLogo: "leipzigLogo", status: .upcoming, timeStamp: 1710349200, homeTeamScore: nil, awayTeamScore: nil)

let matchData8 = matchData(matchId: 4, homeTeam: "Bayern Munich", awayTeam: "RB Leipzig", homeLogo: "bayernLogo", awayLogo: "leipzigLogo", status: .upcoming, timeStamp: 1710354600, homeTeamScore: nil, awayTeamScore: nil)

let matches1: Array<matchData> = [matchData2, matchData4, matchData3, matchData2, matchData4, matchData3, matchData1].sorted(by: { $0.timeStamp < $1.timeStamp })
let matches2: Array<matchData> = [matchData5, matchData6, matchData7, matchData5, matchData6, matchData7, matchData8].sorted(by: { $0.timeStamp < $1.timeStamp })

let matches = matches1 + matches2

let leagueInfo1 = LeagueInfo(countryName: "Spain", leagueName: "LaLiga", leagueLogo: "LaLigaLogo", matches: matches1)
let leagueInfo2 = LeagueInfo(countryName: "Germany", leagueName: "Bundesliga", leagueLogo: "BundesligaLogo", matches: matches2)

let leaguesData = [leagueInfo1, leagueInfo2]
