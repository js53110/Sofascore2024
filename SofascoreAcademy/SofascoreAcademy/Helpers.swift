//
//  Helpers.swift
//  SofascoreAcademy
//
//  Created by Akademija on 18.03.2024..
//

import Foundation

func updateScore(matchId: Int) -> (Int, Int)? {
    if let match = leagueData.first(where: { $0.matchId == matchId }) {
        if let homeScore = match.homeTeamScore, let awayScore = match.awayTeamScore {
            return (homeScore, awayScore)
        }
    }
    return nil
}

func updateStatus(matchId: Int) -> matchStatus {
    if let match = leagueData.first(where: { $0.matchId == matchId }) {
        let matchStatus = match.status
        return matchStatus
    }
    return matchStatus.upcoming
}

func determineMatchStatus(matchStatus: matchStatus) -> String {
    
    switch matchStatus {
    case .finished:
        return "FT"
    case .inProgress:
        return "37'" // tu kasnije mogu dodat funkciju za dinamicko izracunavanje vremena
    default:
        return "-"
    }
}

func convertTimestampToTime(timeStamp: TimeInterval) -> String {
    
    let date = Date(timeIntervalSince1970: timeStamp)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let timeString = dateFormatter.string(from: date)
    return timeString
}
