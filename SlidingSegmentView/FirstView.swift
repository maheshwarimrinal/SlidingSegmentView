//
//  FirstView.swift
//  SlidingSegmentView
//
//  Created by Mrinal Maheshwari on 17/04/20.
//  Copyright © 2020 Mrinal Maheshwari. All rights reserved.
//

import UIKit

class FirstView: UIView {

    let contentView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.backgroundColor = .gray
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
    
}
