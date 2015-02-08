//
//  ViewController.swift
//  myCardHelper3
//
//  Copyright (c) 2014 Justin Bastawrose. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView?
    @IBOutlet weak var _textDeckNumber: UITextField!
    @IBOutlet weak var labelDeckNumber: UILabel!
    @IBOutlet weak var _stepperDeckCountOutlet: UIStepper!
    var numberOfCells = 13
    var deckCount = 52.0
    var cardCounts = Array( count: 13, repeatedValue: 4.0 )
    var cardPercents = Array( count: 13, repeatedValue: 0.0 )
    var outputArray = Array( count: 13, repeatedValue: 7.69 )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell" )
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
        
        if ( indexPath.row == 0 ){
            cell.imageView?.image = UIImage(named: "ace")
            cell.textLabel?.text = "Ace: \(outputArray[0])%"
        }
        if ( indexPath.row == 1 ){
            cell.imageView?.image = UIImage(named: "two")
            cell.textLabel?.text = "Two: \(outputArray[1])%"
        }
        if ( indexPath.row == 2 ){
            cell.imageView?.image = UIImage(named: "three")
            cell.textLabel.text = "Three: \(outputArray[2])%"
        }
        if ( indexPath.row == 3 ){
            cell.imageView?.image = UIImage(named: "four")
            cell.textLabel.text = "Four: \(outputArray[3])%"
        }
        if ( indexPath.row == 4 ){
            cell.imageView?.image = UIImage(named: "five")
            cell.textLabel.text = "Five: \(outputArray[4])%"
        }
        if ( indexPath.row == 5 ){
            cell.imageView?.image = UIImage(named: "six")
            cell.textLabel.text = "Six: \(outputArray[5])%"
        }
        if ( indexPath.row == 6 ){
            cell.imageView?.image = UIImage(named: "seven")
            cell.textLabel.text = "Seven: \(outputArray[6])%"
        }
        if ( indexPath.row == 7 ){
            cell.imageView?.image = UIImage(named: "eight")
            cell.textLabel.text = "Eight: \(outputArray[7])%"
        }
        if ( indexPath.row == 8 ){
            cell.imageView?.image = UIImage(named: "nine")
            cell.textLabel.text = "Nine: \(outputArray[8])%"
        }
        if ( indexPath.row == 9 ){
            cell.imageView?.image = UIImage(named: "ten")
            cell.textLabel.text = "Ten: \(outputArray[9])%"
        }
        if ( indexPath.row == 10 ){
            cell.imageView?.image = UIImage(named: "jack")
            cell.textLabel.text = "Jack: \(outputArray[10])%"
        }
        if ( indexPath.row == 11 ){
            cell.imageView?.image = UIImage(named: "queen")
            cell.textLabel.text = "Queen: \(outputArray[11])%"
        }
        if ( indexPath.row == 12 ){
            cell.imageView?.image = UIImage(named: "king")
            cell.textLabel.text = "King: \(outputArray[12])%"
        }
        
        // DONE or want to document
        // optimize above if statements
        // cell.textLabel.textAlignment = .Right
        // cell.textLabel.baselineAdjustment = .AlignCenters
        // add MODE for high and low percentages
        // add MODE for % per suit functionality
        // add MODE for % per card - what it is now
        // why does not having 4.0 above break the for loop? * note in technical documentation.
        // add reset button
        // add button for changing number of decks!
        // accessibility labels for UI testing
        // fix to make sure nothing happens when tapping on a 0.0% chance
        // add a help button
        // how to stop help button from resetting application - did this by creating a custom view controller class for HELP
        // add cell images
        
        // change dates in all source files
        // create user manual and put into help page of app *** (Quick Start Guide / Detailed User Manual)
        // app icon
        // splash page
        // change button names (add _underscore) and check references
        // change second view controller name and check references
        // write test cases / user stories / test plan / and code automated tests with Instruments
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
        
        if(cardCounts[indexPath.row] != 0.0){
        cardCounts[indexPath.row]--
        deckCount--
        
        var i:Int
        for i = 0; i <= 12; ++i {
            cardPercents[i] = cardCounts[i] / deckCount
            cardPercents[i] *= 100
            if ( cardPercents[i] <= 0.0 ){
                cardPercents[i] = 0.0
            }
            outputArray[i] = ( round( cardPercents[i] * 100 ) / 100 )
        }
        self.collectionView?.reloadData()
        }
    }
    
    @IBAction func _stepperDeckCount(sender: UIStepper) {
        
        var deckNum:String = String(format: "%.f", _stepperDeckCountOutlet.value)
        self.labelDeckNumber.text = deckNum
        
        var i:Int
        for i = 0; i <= 12; ++i {
            self.cardCounts[i] = (_stepperDeckCountOutlet.value * 4.0)
        }
        
        self.deckCount = (52 * _stepperDeckCountOutlet.value)
        
        for i = 0; i <= 12; ++i {
            cardPercents[i] = cardCounts[i] / deckCount
            cardPercents[i] *= 100
            if ( cardPercents[i] <= 0.0 ){
                cardPercents[i] = 0.0
            }
            outputArray[i] = ( round( cardPercents[i] * 100 ) / 100 )
        }
        
        self.collectionView?.reloadData()
    }
    
    @IBAction func buttonReset(sender: UIButton) {
        
        _stepperDeckCountOutlet.value = 1
        self.labelDeckNumber.text = "1"
        
        var i:Int
        for i = 0; i <= 12; ++i {
            cardCounts[i] = 4
            cardPercents[i] = 0
            outputArray[i] = 7.69
        }
        
        self.collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



