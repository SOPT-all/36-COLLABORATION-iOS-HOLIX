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

    // MARK: - Properties

    private var customTextViewHeightConstraint: Constraint?
    private var customTextViewBottomConstraint: Constraint?

    var clubTitle: String?

    // MARK: - UI Components

    private let customNavigationBar = CustomNavigationBar(
        titleLabel: "",
        hasMenuButton: true
    )


    private var chattingList = [Chatting]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.scrollToBottom(animated: true)
            }
        }
    }
    var groupedChatting: [(date: String, chatList: [Chatting])] = []
    
    // MARK: - UI Components

    private let customNavigationBar = CustomNavigationBar(
        titleLabel:"iOS 개발자로써 성공하고 싶은 사람들",
        hasMenuButton: true,
        tintColor: .black
    )
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let textView = CustomTextView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setupTableView()
        tagScrollView()
        setDelegate()
        setupDismissKeyboardGesture()

        bindActions()
        loadChatting(clubId: "1")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotifications()
    }

    // MARK: - SetUI

    private func setUI() {
        self.view
            .addSubviews(
                customNavigationBar,
                tableView,
                textView
            )
        if let clubTitle = clubTitle {
            customNavigationBar.setTitle(clubTitle)
        }
    }

    // MARK: - SetStyle

    private func setStyle() {
        self.view.backgroundColor = .white
        tableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
        }

        textView.do {
            $0.backgroundColor = .white
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(customNavigationBar.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(textView.snp.top)
        }

        textView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            self.customTextViewBottomConstraint = $0.bottom.equalToSuperview().constraint
        }

        textView.onHeightChange = { [weak self] newHeight in
            guard let self = self else { return }

            self.customTextViewHeightConstraint?.update(offset: newHeight)

            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
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
        tableView.register(SystemMessageCell.self, forCellReuseIdentifier: "SystemMessageCell")
    }

    private func tagScrollView() {
        textView.addTag(title: "Swift")
        textView.addTag(title: "UIKit")
        textView.addTag(title: "1234")
        textView.addTag(title: "UIK12312it")
        textView.addTag(title: "Swi1ft")
        textView.addTag(title: "UIKit")
    }

    // MARK: - SetDelegate

    private func setDelegate() {
        customNavigationBar.delegate = self
    }
}

// MARK: - UITableViewDelegate,UITableViewDataSource

extension ChattingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear

        let label = UILabel()
        label.text = groupedChatting[section].date
        label.textAlignment = .center
        label.font = .pretendard(.label3_r_11)
        label.textColor = .darkGray

        headerView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 15
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return groupedChatting.count
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return groupedChatting[section].date
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return groupedChatting[section].chatList.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let chat = groupedChatting[indexPath.section].chatList[indexPath.row]
        
        switch ChattingType(rawValue: chat.chattingType) {
        case .user:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChattingCell",
                for: indexPath
            ) as? ChattingCell else {
                return UITableViewCell()
            }
            cell.configure(
                with: chat.contents,
                nickname: chat.userName,
                profileImage: chat.imageUrl,
                isSender: chat.isMine,
                introduction: chat.introduction,
                createdAt: chat.formattedCreatedAt
            )
            return cell

        case .system:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "SystemMessageCell",
                for: indexPath
            ) as? SystemMessageCell else {
                return UITableViewCell()
            }
            cell.configure(text: chat.contents)
            return cell

        case .none:
            return UITableViewCell()
        }
    }
}

// MARK: - Keyboard

extension ChattingViewController {

    private func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }

        let keyboardHeight = keyboardFrame.height
        self.customTextViewBottomConstraint?.update(offset: -3)

        UIView.animate(withDuration: duration) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
            self.textView.movePlusButtonToBottom(true)
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        self.customTextViewBottomConstraint?.update(offset: 0)
        UIView.animate(withDuration: duration) {
            self.view.transform = .identity
            self.textView.movePlusButtonToBottom(false)
        }
    }

    private func setupDismissKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ChattingViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIButton || touch.view is UITextView {
            return false
        }
        return true
    }
}


// MARK: - Fetching & Loading


extension ChattingViewController {
    func fetchClubChatting(clubId: String) async throws -> ClubChattingResponse? {
        do {
            let chatting = try await ClubChattingService.shared.getClubChatting(clubId: clubId)
            print("클럽 정보 조회 성공: \(chatting)")
            return chatting
        } catch {
            print("클럽 정보 조회 실패: \(error)")
            return nil
        }
    }

    func loadChatting(clubId: String) {
        Task {
            do {
                guard let chatting = try await fetchClubChatting(clubId: clubId) else {
                    print("클럽 정보가 없습니다")
                    return
                }
                let chattingList = chatting.data.chattingList
                self.chattingList = chattingList
                self.groupChattingByDate(chattingList)
                self.tableView.reloadData()
                self.scrollToBottom(animated: true)
            } catch {
                print("에러: \(error)")
            }
        }
    }

    private func bindActions() {
        textView.onSendSuccess = { [weak self] in
            self?.loadChatting(clubId: "1")
        }
    }
    
    func groupChattingByDate(_ chatList: [Chatting]) {
        let groupedDict = Dictionary(grouping: chatList) { $0.createdDateOnly }
        let sortedKeys = groupedDict.keys.sorted { $0 < $1 }

        groupedChatting = sortedKeys.map { key in
            (date: key, chatList: groupedDict[key] ?? [])
        }
    }
    
    func scrollToBottom(animated: Bool) {
        guard tableView.numberOfSections > 0 else { return }
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section) - 1
        guard row >= 0 else { return }

        let indexPath = IndexPath(row: row, section: section)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: animated)
    }
}

// MARK: - CustomNavigationBarDelegate

extension ChattingViewController: CustomNavigationBarDelegate {
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }

    func didTapSearchButton() {}
    func didTapMenuButton() {}
}
