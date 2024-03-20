import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController, BaseViewProtocol {

    private let leagueView: LeagueView = .init(leagueData: leagueData.sorted(by: { $0.timeStamp < $1.timeStamp }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        styleViews()
        setupConstraints()
        setupGestureRecognizers()
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
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setupGestureRecognizers() {
    }
}
