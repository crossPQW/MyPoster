//
//  Poster+DnD.swift
//  MyPoster
//
//  Created by 黄少华 on 2017/8/25.
//  Copyright © 2017年 黄少华. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        //获取放置的位置
        let location = session.location(in: poster)
        
        //响应事件
        session.loadObjects(ofClass: UIColor.self) {
            guard let color = $0.first as? UIColor else { return }
            
            if location.y < self.poster.bounds.midY {
                self.titleColor = color
                self.drawPoster()
            }
        }
    }
}
