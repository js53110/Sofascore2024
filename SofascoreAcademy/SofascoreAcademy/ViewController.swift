import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController, BaseViewProtocol {
    
    private let leagueView = LeagueView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        addViews()
        styleViews()
        setupConstraints()
        setupGestureRecognizers()
        
//        updateScore(matchId: 3, score: 3, side: .home)
//        updateScore(matchId: 3, score: 2, side: .away)
//        updateMatchStatus(matchId: 3, status: .inProgress)
//        updateMatchTime(matchId: 2, time: 39)
    }
    
    func addViews() {
        view.addSubview(leagueView)
    }
    
    func styleViews() {
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        leagueView.snp.makeConstraints() {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setupGestureRecognizers() {
    }
}

//extension ViewController { //funkcije za update određenih parametara
//    func updateScore(matchId: Int, score: Int, side: teamSide) {
//        leagueView.updateScore(matchId: matchId, score: score, side: side)
//    }
//    
//    func updateMatchStatus(matchId: Int, status: matchStatus) {
//        leagueView.updateMatchStatus(matchId: matchId, status: status)
//    }
//    
//    func updateMatchTime(matchId: Int, time: Int) {
//        leagueView.updateMatchTime(matchId: matchId, time: time)
//    }
//}
