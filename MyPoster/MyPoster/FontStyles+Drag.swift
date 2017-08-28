//
//  FontStyles+Drag.swift
//  MyPoster
//
//  Created by 黄少华 on 2017/8/28.
//  Copyright © 2017年 黄少华. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices


extension FontStylesViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let string = fontNames[indexPath.row]
        guard let data = string.data(using: .utf8) else { return [] }
        
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
        
        return [UIDragItem(itemProvider: itemProvider)]
    }
}
