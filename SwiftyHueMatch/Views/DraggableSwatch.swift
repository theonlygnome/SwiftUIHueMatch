//
//  DraggableSwatch.swift
//  SwiftyHueMatch
//
//  Created by Naomi Anderson on 2/7/24.
//

import SwiftUI

struct DraggableSwatch<Draggable: Gesture>: View {
    let swatch: Swatch
    private let size: CGFloat = 150
    let position: CGPoint
    let gesture: Draggable
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(swatch.color)
            .frame(width: size, height: size)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .position(position)
            .gesture(gesture)
    }
}

#Preview {
    DraggableSwatch(swatch: Swatch.all.first!,
                    position: CGPoint(x: 100, y: 100), gesture: DragGesture())
}
