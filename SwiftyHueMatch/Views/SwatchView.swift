//
//  SwatchView.swift
//  SwiftyHueMatch
//
//  Created by Naomi Anderson on 2/7/24.
//

import SwiftUI

struct SwatchView: View {
    @StateObject private var viewModel = SwatchViewModel()
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmDrop()
                }
            }
    }
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    DraggableSwatch(swatch: viewModel.currentSwatch(color: color), position: viewModel.currentPosition, gesture: drag)
                }
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                VStack {
                    ForEach(viewModel.swatchContainers, id:\.id) { swatch in
                        SwatchContainer(swatch: swatch, viewModel: viewModel)
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SwatchView()
}
