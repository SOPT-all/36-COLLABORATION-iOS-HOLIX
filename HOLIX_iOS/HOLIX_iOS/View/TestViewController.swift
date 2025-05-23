//
//  ViewController.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/9/25.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
    private let customNavigationBar = CustomNavigationBar(hasMenuButton: true)
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddSubview()
        setupUI()
        setStyle()
        customNavigationBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setAddSubview() {
        self.view.addSubview(customNavigationBar)
    }

    private func setupUI() {
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }

    private func setStyle() {
        self.view.backgroundColor = .white
    }
}

extension TestViewController: CustomNavigationBarDelegate {

    func didTapBackButton() {
        print("VC에서 받음 backButton Actions")
        self.navigationController?.popViewController(animated: true)
    }

    func didTapSearchButton() {
        print("VC에서 받음 searchButton Actions")
    }

    func didTapMenuButton() {
        print("VC에서 받음 menuButton Actions")
    }
}
