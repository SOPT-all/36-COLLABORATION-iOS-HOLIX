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
    let mockChattingData = DummyChattingData.generate()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mockChattingData)
    }
}
