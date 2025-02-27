//
//  Tip.swift
//  SwiftUIPrep
//
//  Created by Vlad on 25/2/25.
//

import Foundation
import TipKit

struct AddToFavoritesTip: Tip {
    var id = UUID()
    
    var title: Text {
        Text("Add some question in favorites")
    }
    
    var message: Text? {
        Text("Just slide left for adding to favorites")
    }
    
    var image: Image? {
        Image(systemName: "star")
    }
}

struct ShuffleListButtonTip: Tip {
    var id = UUID()
    
    var title: Text {
        Text("Shuffle the list")
    }
    
    var message: Text? {
        Text("Tap to shuffle the list of questions")
    }
    
    var image: Image? {
        Image(systemName: "shuffle")
    }
}
