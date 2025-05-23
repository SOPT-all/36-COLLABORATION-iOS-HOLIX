<div align="center">
    <div>
        <img width="100%" src="https://github.com/user-attachments/assets/dac5248b-6708-4fd3-b3db-3ccc5d1ccd96">
    </div>
    <div>
        <h1 style="margin: 20px 0;">Holix 나를 재발견하다,</h1>
    </div>
</div>


</br>

| 프로젝트 설명 | IT 벤처 창업 동아리 SOPT 합동 세미나 |
| :---: | :---: |
| 프로젝트 기간 | 2025.05 |

<br>

##  Developers

| <img src="https://github.com/user-attachments/assets/ee0b6e59-4349-4b08-8e1c-6d92fc20fe19" width="250"><br><br> **정정욱** <br> [@jeonguk29](https://github.com/jeonguk29) <br><br> 프로젝트, 네트워크 세팅 및 Home View 담당 | <img src="https://github.com/user-attachments/assets/90d1f3d8-b9f4-4723-ad1d-edb9edf0edcd" width="250"><br><br> **진소은** <br> [@rosejinse](https://github.com/rosejinse) <br><br> 내 클럽 View 담당 | <img src="https://github.com/user-attachments/assets/79bac778-ecdf-438c-8a29-859166bdb863" width="250"><br><br> **임재현** <br> [@LimJaeHyeon9298](https://github.com/LimJaeHyeon9298) <br><br> 내 클럽 Detail 및 Chatting View 담당 |
|:--:|:--:|:--:|

<br>

## 🎫 Screenshot
<!-- 작업한 화면이 있다면 스크린 샷으로 첨부해주세요. -->
|    구현 내용    |   SE   |   13 mini   |   15 pro   |
| :-------------: | :----------: | :----------: | :----------: |
| GIF | <img src = "https://github.com/user-attachments/assets/76de1225-8c5d-4bba-b2f4-35cc60111755" width ="250"> | <img src = "https://github.com/user-attachments/assets/36855b77-a2fe-456c-a782-fdddeea10d1e" width ="250"> | <img src = "https://github.com/user-attachments/assets/bc729bac-3ba4-415f-b3e1-75aafe281382" width ="250"> |

<br>

#  Conventions
[💻 Code Convention](https://sopt-official.notion.site/codeConvention-1ee1e48dd960802b9709edcbe2244515)<br>
[📝 Branch Convention + Issue Convention](https://sopt-official.notion.site/branchConvention-issueConvention-1ee1e48dd960806caf13f98eaa107903)<br>
[👀 PR Convention](https://sopt-official.notion.site/pullRequestConvention-1ee1e48dd9608040a86cdc3e783ee7f5)<br>
[👀 Commit Convention](https://sopt-official.notion.site/commitConvention-1ee1e48dd9608085955fce4f5ec0af24)<br>

<br>


# Git Flow
[우아한형제들 Git-flow](https://techblog.woowahan.com/2553/)를 기반으로 합니다.</br>
이슈명은 [Unit] 작업 내용 형식으로 작성합니다. (예시: [Feature] 컴포넌트 제작)
1. Project board에서 issue를 생성합니다.
2. develop 브랜치에서 새로운 브랜치로 checkout 합니다.
3. 해당 브랜치에서 작업을 진행하고, 작업을 나누어 commit합니다.
4. 작업 완료 후 빌드가 되는지 확인 후 push합니다.
5. PR을 작성합니다.
6. 모든 팀원들의 approve를 받은 후 merge합니다.
</br>


# Foldering Strategy
```
HOLIX_iOS
├── App
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
│
├── Base
│   ├── MainTabBarController.swift
├── Global
│   └── Component
│       └── CategoryTabBar
│           ├── CategoryTabBarCell.swift
│           └── CategoryTabBarView.swift
│
├── Model
│   ├── MyClubModel.swift
│   ├── RecommendedClubModel.swift
│   ├── BannerResponse.swift
│   └── CategoryBoxMenuResponse.swift
│
├── Network
│   ├── Core
│   │   ├── APIService.swift
│   │   ├── Endpoint.swift
│   │   ├── HTTPMethod.swift
│   │   └── NetworkError.swift
│   ├── Config
│   ├── Request
│   ├── Response
│   │   ├── ClubResponse.swift
│   │   ├── StudyResponse.swift
│   │   ├── ClubDetailResponse.swift
│   │   └── ClubChattingResponse.swift
│   └── Services
│       ├── ClubService.swift
│       ├── HomeService.swift
│       └── ClubChattingService.swift
│
├── Resource
│   ├── Font
│   ├── Assets
│   ├── LaunchScreen
│   └── Info
│
├── View
│   ├── MyClub
│   │   ├── Cell
│   │   │   ├── MyClubCell.swift
│   │   │   └── RecommendedClubCell.swift
│   │   ├── View
│   │   │   ├── MyClubView.swift
│   │   │   └── RecommendedClubView.swift
│   │   └── ViewController
│   │       └── MyClubMainViewController.swift
│   │
│   ├── Chatting
│   │   ├── ChattingCell
│   │   │   ├── ChattingCell.swift
│   │   │   └── BubbleLabelView.swift
│   │   ├── ChattingViewController.swift
│   │   └── ChattingMockData.swift
│   │
│   ├── ClubDetail
│   │   ├── ClubDetailViewController.swift
│   │   └── ClubInfoView.swift
│   │
│   └── Home
│       ├── Component
│       │   └── TopSearchHeaderView.swift
│       ├── Header
│       │   └── HomeSectionHeader.swift
│       ├── Cell
│       │   ├── BannerCell.swift
│       │   ├── CategoryBoxCell.swift
│       │   └── ContentCardCell.swift
│       └── Layout
│           └── HomeSectionLayoutFactory.swift
```

<br>

# Library
| Name         | Version  |          |
| ------------ |  :-----: |  ------------ |
| [SnapKit](https://github.com/SnapKit/SnapKit) | `5.7.1` | 코드 기반으로 오토레이아웃을 간결하고 직관적으로 구성할 수 있도록 도와주는 DSL 기반의 레이아웃 라이브러리입니다. |
| [Then](https://github.com/devxoul/Then) | `3.0.0` | Swift 객체를 더 깔끔하게 초기화할 수 있게 해주는 유틸리티 라이브러리로, 코드의 가독성을 높이고 중복을 줄여줍니다. |
| [KingFisher](https://github.com/onevcat/Kingfisher) |  `8.3.2`  | 	이미지 다운로드 및 캐싱을 효율적으로 처리할 수 있도록 지원하는 라이브러리로, 네트워크 이미지 로딩을 간편하게 구현할 수 있습니다.|

<br>

# Trouble Shooting
[🔥 Trouble Shooting](https://sopt-official.notion.site/1ee1e48dd9608050a7d7e325fcc025ab)

# 회고
[🥹 회고](https://sopt-official.notion.site/1f21e48dd96080c5ba56c7dcfdeb4e0a)
