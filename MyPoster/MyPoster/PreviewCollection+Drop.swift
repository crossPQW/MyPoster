//
//  PreviewCollection+Drop.swift
//  MyPoster
//
//  Created by 黄少华 on 2017/8/28.
//  Copyright © 2017年 黄少华. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        if collectionView == previewCollection {
            coordinator.session.loadObjects(ofClass: UIImage.self, completion: {
                guard let draggedImage = $0.first as? UIImage else {return}
                
                self.posterPreviews.append(draggedImage)
                self.previewCollection.reloadData()
            })
        }
    }
}
