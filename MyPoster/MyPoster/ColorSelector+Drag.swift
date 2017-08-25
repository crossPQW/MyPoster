//
//  ColorSelector+Drag.swift
//  MyPoster
//
//  Created by 黄少华 on 2017/8/25.
//  Copyright © 2017年 黄少华. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let color = colors[indexPath.row]
        let provider = NSItemProvider(object: color)
        let item = UIDragItem(itemProvider: provider)
        return [item]
    }
}
