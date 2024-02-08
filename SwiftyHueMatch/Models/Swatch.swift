//
//  Swatch.swift
//  SwiftyHueMatch
//
//  Created by Naomi Anderson on 2/7/24.
//

import SwiftUI

struct Swatch {
    let id: Int
    let color: Color
}

extension Swatch {
    static let all = [
        Swatch(id: 1, color: .red),
        Swatch(id: 2, color: .orange),
        Swatch(id: 3, color: .green),
        Swatch(id: 4, color: .blue),
    ]
}
