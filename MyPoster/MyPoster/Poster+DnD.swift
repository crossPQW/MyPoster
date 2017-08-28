//
//  Poster+DnD.swift
//  MyPoster
//
//  Created by 黄少华 on 2017/8/25.
//  Copyright © 2017年 黄少华. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

extension ViewController: UIDragInteractionDelegate {
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        guard let image = poster.image else { return [] }
        
        let provider = NSItemProvider(object: image)
        return [UIDragItem(itemProvider: provider)]
    }
}

extension ViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        //获取放置的位置
        let location = session.location(in: poster)
        
        //响应事件
        if session.hasItemsConforming(toTypeIdentifiers: [kUTTypePlainText as String]) {
            session.loadObjects(ofClass: NSString.self, completion: {
                guard let string = $0.first as? NSString else { return }
                if location.y < self.poster.bounds.midY {
                    self.titleFontName = string as String
                    self.drawPoster()
                }
            })
        } else if session.hasItemsConforming(toTypeIdentifiers: [kUTTypeImage as String]) {
            session.loadObjects(ofClass: UIImage.self, completion: {
                guard let draggedImage = $0.first as? UIImage else { return }
                
                self.posterBg = draggedImage
                self.drawPoster()
            })
        } else {
            session.loadObjects(ofClass: UIColor.self) {
                guard let color = $0.first as? UIColor else { return }
                
                if location.y < self.poster.bounds.midY {
                    self.titleColor = color
                    self.drawPoster()
                }
            }
        }
    }
}
