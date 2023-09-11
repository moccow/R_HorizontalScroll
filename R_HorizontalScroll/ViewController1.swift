//
//  ViewController1.swift
//  R_HorizontalScroll
//
//  Created by m.ishiyama on 2023/09/11
//
//

import UIKit

class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // UIScrollViewの作成
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        // Auto Layoutを使用してUIScrollViewを配置
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100.0).isActive = true

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

        let marginLeft = UIView()
        marginLeft.backgroundColor = .black
        marginLeft.translatesAutoresizingMaskIntoConstraints = false
        marginLeft.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        stackView.addArrangedSubview(marginLeft)

        // ビューをランダムに作成してStackViewに追加
        let count = 8
        for i in 0..<count {
            setSubContainer(parentStack: stackView)
            if i != (count-1) {
                let spacer = UIView()
                spacer.backgroundColor = .white
                spacer.translatesAutoresizingMaskIntoConstraints = false
                spacer.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
                stackView.addArrangedSubview(spacer)
            }
        }
        
        let marginRight = UIView()
        marginRight.backgroundColor = .black
        marginRight.translatesAutoresizingMaskIntoConstraints = false
        marginRight.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        stackView.addArrangedSubview(marginRight)

    }
    
    func setSubContainer(parentStack: UIStackView) {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        parentStack.addArrangedSubview(stackView)
        

        let numberOfSubViews = Int(arc4random_uniform(8)) + 1
        print("numberOfSubViews: \(numberOfSubViews)")
        let subViewWidth = 50.0
        for _ in 1...numberOfSubViews {
            let subView = UIView()
            subView.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0) // ランダムな背景色
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.widthAnchor.constraint(equalToConstant: subViewWidth).isActive = true // サブビューの幅を設定
            stackView.addArrangedSubview(subView)
        }
    }
}
