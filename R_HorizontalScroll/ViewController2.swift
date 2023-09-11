//
//  ViewController2.swift
//  R_HorizontalScroll
//  
//  Created by m.ishiyama on 2023/09/11
//  
//

// 可変幅のViewを配置したスクロールビュー

import UIKit


class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // UIScrollViewの作成
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        // Auto Layoutを使用してUIScrollViewを配置
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // コンテンツ用のStackViewを作成
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal // 横方向のStackViewに設定
        stackView.alignment = .fill
        stackView.distribution = .fill
        scrollView.addSubview(stackView)

        // Auto Layoutを使用してStackViewの高さをUIScrollViewに一致させ、横幅を可変に設定
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true

        // ビューをランダムに作成してStackViewに追加
        for _ in 1...10 {
            let subview = UIView()
            subview.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(subview)

            subview.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0) // ランダムな背景色

            // サブビューの幅を設定（StackView内で自動的に均等に配置されます）
            subview.widthAnchor.constraint(equalToConstant: CGFloat.random(in: 50...200)).isActive = true
        }
    }
}

