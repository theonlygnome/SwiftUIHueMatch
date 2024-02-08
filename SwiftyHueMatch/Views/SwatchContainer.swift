//
//  SwatchContainer.swift
//  SwiftyHueMatch
//
//  Created by Naomi Anderson on 2/7/24.
//

import SwiftUI

struct SwatchContainer: View {
    let swatch: Swatch
    @ObservedObject var viewModel: SwatchViewModel
    private let size: CGFloat = 150
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(swatch.color)
            .frame(width: size, height: size)
            .opacity(viewModel.isHighlighted(id: swatch.id) ? 0.5 : 1.0)
            .overlay {
                GeometryReader { proxy -> Color in
                    viewModel.update(frame: proxy.frame(in: .global), for: swatch.id
                    )
                    return Color.clear
                }
            }
    }
}

#Preview {
    SwatchContainer(swatch: Swatch.all.first!, viewModel: SwatchViewModel())
}
