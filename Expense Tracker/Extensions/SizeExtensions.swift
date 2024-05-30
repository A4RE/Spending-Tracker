//
//  SizeExtensions.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 30.05.2024.
//

import UIKit

extension Double {
    
    func adjustSize() -> Double {
        
        let iPhone14ProScreenWidth = 393.0 / self
        return UIScreen.main.bounds.width / iPhone14ProScreenWidth
    }
}
