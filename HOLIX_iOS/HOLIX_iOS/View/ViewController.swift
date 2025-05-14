//
//  ViewController.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/9/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let customNavigationBar = CustomNavigationBar(haveMenuButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(customNavigationBar)
        
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
