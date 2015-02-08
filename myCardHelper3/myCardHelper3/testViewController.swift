//
//  testViewController.swift
//  myCardHelper3
//
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var _textHelp: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _textHelp.text = "User Manual: \n \n The purpose of this app is to display the probabilities of the next card being drawn. The app begins in a state where no cards are drawn using only 1 standard 52-card deck. Thus, the percentage for drawing any card to begin with are all the same, 7.69%. \n\n  First, set the number of decks that you or the dealer are using in your game. Use the **+** button to add more decks (up to 10). Use the **-** button if you overshot. \n\n  When a dealer draws a card, tap the number of that card on the app. Immediately, the app updates the probabilties of all the cards for the next draw. The higher the percentage for a card, the higher the chances (probability) that card may be drawn. Naturally, when the percentage for a card reaches 0.0%, there are no more of those cards in the deck(s). \n\n  Use the reset button to start over. \n\n  Feel free to leave the app and come back, the app will save its state. \n\n  NOTE: The alternating colors that are statically displayed in the app are unrelated to the draws or probabilities associated with that card type. \n\n  NOTE2: Don't worry, no matter how many decks are being used, the starting probabilities will always stay at 7.69% because they are still proportional to the original, they are simply multiplied by the number of decks being used. You will only begin to see a drastic difference immediately after the first card is drawn."
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func _buttonClose(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
