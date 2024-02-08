//
//  SwatchViewModel.swift
//  SwiftyHueMatch
//
//  Created by Naomi Anderson on 2/7/24.
//

import SwiftUI

class SwatchViewModel: ObservableObject {
    // MARK: - Gesture Properties
    let currentSwatch = Swatch(id: 0, color: .red)
    
    @Published var currentPosition = CGPoint(
        x: UIScreen.main.bounds.midX / 2,
        y: UIScreen.main.bounds.maxY / 2 - 75
        )
    @Published var highlightedId: Int?
    
    // MARK: - Coordinates
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX / 2,
        y: UIScreen.main.bounds.maxY / 2 - 75
        )
    private var frames: [Int: CGRect] = [:]
    
    // MARK: - Objects in the screen
    var swatchContainers = Swatch.all
    
    // MARK: - Updates in the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func update(dragPosition: CGPoint)  {
        currentPosition = dragPosition
        for(id, frame) in  frames where frame.contains(CGPoint(x: dragPosition.x + 5, y: dragPosition.y + 5))  {
            highlightedId = id
            return
        }
        
        highlightedId = nil
    }
    
    func confirmDrop() {
        resetPosition()
        defer { highlightedId = nil }

        guard let highlightedId = highlightedId else {
            return
        }
        
        // TODO:  figure out if highlightedId == match id
        
    }
    
    func resetPosition() {
        currentPosition = SwatchViewModel.initialPosition
    }
    
    func isHighlighted(id: Int) -> Bool {
        highlightedId == id
    }
    
//    func getSwatchColor() -> Color {
//        let r = Int.random(in: 0...255)
//        let g = Int.random(in: 0...255)
//        let b = Int.random(in: 0...255)
//        return Color(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255)
//    }
    
//    func changeColor() -> [Color] {
//            let r = Int.random(in: 0...255)
//            let g = Int.random(in: 0...255)
//            let b = Int.random(in: 0...255)
//            
//            print("red: \(r), green: \(g), blue: \(b)")
//            swatch.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
//            
//            var guesses = [ UIColor(red: CGFloat(r-40)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0),
//                                                  UIColor(red: CGFloat(r)/255, green: CGFloat(g-40)/255, blue: CGFloat(b)/255, alpha: 1.0),
//                                                  UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b-40)/255, alpha: 1.0)]
//            
//            // Adjust in the other direction if the color is too close to black
//            if r < 40 {
//                guesses[0] = UIColor(red: CGFloat(r+80)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
//            }
//            if g < 40 {
//                guesses[1] = UIColor(red: CGFloat(r)/255, green: CGFloat(g+80)/255, blue: CGFloat(b)/255, alpha: 1.0)
//            }
//            if b < 40 {
//                guesses[2] =  UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b+80)/255, alpha: 1.0)
//            }
//                
//            // Randomly select which button will hold the correct option
//            correctSelection = Int.random(in: 0...3)
//            
//            for i in 0 ..< buttonOptionArr.count {
//                if i == correctSelection {
//                    buttonOptionArr[i].backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
//                } else {
//                    buttonOptionArr[i].backgroundColor = guesses[0]
//                    // Once the guess has been used, remove it.  There is probably a slicker way of doing this
//                    guesses.remove(at: 0)
//                }
//
//            }
//            
//        }
//    }
}
