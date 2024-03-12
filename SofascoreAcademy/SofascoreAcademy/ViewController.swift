//
//  ViewController.swift
//  SofascoreAcademy
//
//  Created by Akademija on 08.03.2024..
//

import UIKit
import Foundation
import SnapKit

class ViewController: UIViewController {

    let leagueView: LeagueView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
                
        view.addSubview(leagueView)
        
        leagueView.snp.makeConstraints() {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.leading.trailing.equalToSuperview() // Match leading and trailing edges of parent

        }
    }
}

