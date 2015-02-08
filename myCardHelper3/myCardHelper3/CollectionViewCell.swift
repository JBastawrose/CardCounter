//
//  CollectionViewCell.swift
//  UICollectionView
//
//  Copyright (c) 2014 Justin Bastawrose. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let textLabel: UILabel!
    let imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 16, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
        
        let textFrame = CGRect(x: 5, y: 75, width: frame.size.width, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        //textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel.font = UIFont.boldSystemFontOfSize(12)
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
    }
}
