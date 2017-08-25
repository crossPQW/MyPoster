//
//  ViewController.swift
//  MyPoster
//
//  Created by 黄少华 on 2017/8/25.
//  Copyright © 2017年 黄少华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorSelector: UICollectionView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var previewCollection: UICollectionView!
    
    var titleText = "Click here to set your title"
    var titleFontName = "Helvetica Neue"
    var titleColor = UIColor.white
    var posterBg: UIImage!
    
    var colors = [UIColor]()
    
    func drawPoster() {
        let drawRect = CGRect(x: 0, y: 0, width: 1600, height: 1400)
        let titleRect = CGRect(x: 200, y: 200, width: 1200, height: 200)
        let titleFont = UIFont(name: titleFontName, size: 90)
        
        let centered = NSMutableParagraphStyle()
        centered.alignment = .center
        
        let titleAttr: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.foregroundColor: titleColor,
            NSAttributedStringKey.font: titleFont,
            NSAttributedStringKey.paragraphStyle: centered
        ]
        
        let renderer = UIGraphicsImageRenderer(size: drawRect.size)
        poster.image = renderer.image {
            UIColor.gray.set()
            $0.fill(drawRect)
            
            posterBg?.draw(at: CGPoint(x: 0, y: 0))
            titleText.draw(in: titleRect, withAttributes: titleAttr)
        }
    }
    
    func generateSafeColors() {
        let colorIndex: [CGFloat] = [0, 51/255, 102/255, 153/255, 204/255, 1]
        
        for i in colorIndex {
            for j in colorIndex {
                for k in colorIndex {
                    colors.append(UIColor(red: i, green: j, blue: k, alpha: 1))
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateSafeColors()
        colorSelector.dataSource = self
        
        drawPoster()
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorSelector {
            return colors.count
        }else{
            let previewFrame = CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
            let promptLabel = UILabel(frame: previewFrame)
            
            promptLabel.text = "Drag your poster here"
            promptLabel.textColor = UIColor.gray
            promptLabel.textAlignment = .center
            
            collectionView.backgroundView = promptLabel
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colorSelector {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
            cell.backgroundColor = colors[indexPath.row]
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 6
            cell.layer.borderColor = UIColor.white.cgColor
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCell", for: indexPath)
            return cell
        }
    }
}












