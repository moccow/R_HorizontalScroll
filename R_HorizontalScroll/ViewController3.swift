//
//  ViewController3.swift
//  R_HorizontalScroll
//  
//  Created by m.ishiyama on 2023/09/11
//  
//

// サブビューの個数によって幅を決定するStackView

import UIKit

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        let numberOfSubViews = 5
        let subViewWidth = 50.0
        for _ in 1...numberOfSubViews {
            let subView = UIView()
            subView.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0) // ランダムな背景色
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.widthAnchor.constraint(equalToConstant: subViewWidth).isActive = true // サブビューの幅を設定
            stackView.addArrangedSubview(subView)
        }
        let stackViewWidth = CGFloat(numberOfSubViews) * subViewWidth
        stackView.widthAnchor.constraint(equalToConstant: stackViewWidth).isActive = true
        
        stackView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
