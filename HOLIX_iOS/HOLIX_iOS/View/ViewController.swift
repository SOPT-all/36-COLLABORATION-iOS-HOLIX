//
//  ViewController.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/9/25.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    //private let customNavigationBar = CustomNavigationBar(hasMenuButton: true)
    private let testButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupAddSubview()
        setupUI()
        setStyle()
        setAddTarget()
    }
    
    private func setupAddSubview() {
        self.view.addSubview(testButton)
    }
    
    private func setupUI() {
        testButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }

    private func setStyle() {
        testButton.backgroundColor = .green
        testButton.setTitle("push", for: .normal)
    }
    
    private func setAddTarget() {
        testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
    }
    
    @objc func testButtonDidTap() {
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
