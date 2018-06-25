//
//  CardModel.swift
//  Matching
//
//  Created by Jordan on 2018-06-23.
//  Copyright © 2018 Jordan. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card]{
        
        // Declare an array to store numbers we've already generated
        var generatedNumberArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        while generatedNumberArray.count < 8 {
            let randomNumber = arc4random_uniform(13) + 1
            
            // Make it so we only have unique pairs of cards
            if generatedNumberArray.contains(Int(randomNumber)) == false {
                // Log the Number
                print(randomNumber)
                
                // Store the number into the generatedNumberArray
                generatedNumberArray.append(Int(randomNumber))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardOne)
                
                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
            }
            
        }
        
        // Randmize the array
        
        for i in 0...generatedCardsArray.count - 1 {
            
            // Find a random index to swap with
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            // Swap the two cards
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }

        
        // Return the array
        return generatedCardsArray
    }
    
}
