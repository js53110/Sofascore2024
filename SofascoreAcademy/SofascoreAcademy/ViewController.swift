import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController, BaseViewProtocol {

    let leagueView: LeagueView = .init(leagueData: leagueData)
    
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
