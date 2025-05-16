//
//  ChattingViewController.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class ChattingViewController: UIViewController {
   
    private let customNavigationBar = CustomNavigationBar(titleLabel:"iOS 개발자로써 성공하고 싶은 사람들" ,hasMenuButton: true)
    private var chattingList = DummyChattingData.generate()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setupTableView()
        
    }
    
    private func setUI() {
        self.view.addSubviews(customNavigationBar,tableView)

    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        tableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
        }
        

    }
    
    private func setLayout() {
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(customNavigationBar.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(300)
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.register(ChattingCell.self, forCellReuseIdentifier: "ChattingCell")
    }

}

extension ChattingViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chattingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingCell", for: indexPath) as! ChattingCell
        let chat = chattingList[indexPath.row]
        cell.configure(
            with: chat.contents,
            nickname: chat.isMine ? nil : chat.userName,
            profileImage: "img_profile_noraml_ios_04",
            isSender: chat.isMine
        )
        return cell
    }
}
