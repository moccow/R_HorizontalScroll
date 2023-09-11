//
//  ViewController1.swift
//  R_HorizontalScroll
//
//  Created by m.ishiyama on 2023/09/11
//
//

import UIKit

class ViewController1: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIScrollViewの作成
        setupScrollView()
        
        // コンテンツ用のStackViewを作成
        setupStackView()
        
        // 左のマージン
        let marginLeft = createMarginView()
        stackView.addArrangedSubview(marginLeft)
        
        // ビューをランダムに作成してStackViewに追加
        let count = 8
        for i in 0..<count {
            setupSubStackView()
            if i != (count-1) {
                let spacer = createSpacerView()
                stackView.addArrangedSubview(spacer)
            }
        }
        
        // 右のマージン
        let marginRight = createMarginView()
        stackView.addArrangedSubview(marginRight)
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        // Auto Layoutを使用してUIScrollViewを配置
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100.0).isActive = true
    }
    
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // Auto Layoutを使用してStackViewの高さをUIScrollViewに一致させ、横幅を可変に設定
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    func setupSubStackView() {
        let subStackView = UIStackView()
        subStackView.axis = .horizontal
        subStackView.alignment = .fill
        subStackView.distribution = .fill
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(subStackView)
        
        let numberOfSubViews = Int(arc4random_uniform(8)) + 1
        print("numberOfSubViews: \(numberOfSubViews)")
        let subViewWidth = 50.0
        for _ in 1...numberOfSubViews {
            let subView = UIView()
            subView.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0) // ランダムな背景色
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.widthAnchor.constraint(equalToConstant: subViewWidth).isActive = true // サブビューの幅を設定
            subStackView.addArrangedSubview(subView)
        }
    }
    
    func createMarginView() -> UIView {
        let marginView = UIView()
        marginView.backgroundColor = .black
        marginView.translatesAutoresizingMaskIntoConstraints = false
        marginView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return marginView
    }

    func createSpacerView() -> UIView {
        let spacer = UIView()
        spacer.backgroundColor = .white
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        return spacer
    }

}
