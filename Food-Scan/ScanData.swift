//
//  ScanData.swift
//  Food-Scan
//
//  Created by Mahir Tahirovic on 05/10/2022.
//

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content : String
    
    init(content: String) {
        self.content = content
    }
}
