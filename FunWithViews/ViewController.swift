//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var leftTopView: UIView!
    @IBOutlet weak var rightTopView: UIView!
    @IBOutlet weak var leftMiddleView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var rightMiddleView: UIView!
    @IBOutlet weak var leftBottomView: UIView!
    @IBOutlet weak var rightBottomView: UIView!
    
    @IBOutlet weak var firstDieRollLabel: UILabel!
    @IBOutlet weak var secondDieRollLabel: UILabel!
    @IBOutlet weak var thirdDieRollLabel: UILabel!
    @IBOutlet weak var fourthDieRollLabel: UILabel!
    @IBOutlet weak var fifthDieRollLabel: UILabel!
    @IBOutlet weak var sixthDieRollLabel: UILabel!
    
                                //when you have an instance of a class, you need all the properties to be set.
    var dieLabels: [UILabel] = [] // need a default value bc there wouldn't be an initializer for this class
    
    var dieViews: [UIView] = []
    var numberOfRolls = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupContainersForLabelsAndViews()
        hideTheLabelsAndViews()
        
    }
    
    func setupContainersForLabelsAndViews()
    {
        
        dieLabels=[firstDieRollLabel, secondDieRollLabel, thirdDieRollLabel, fourthDieRollLabel, fifthDieRollLabel, sixthDieRollLabel]
        
        dieViews=[leftTopView, leftMiddleView, leftBottomView, middleView, rightTopView, rightMiddleView, rightBottomView]
        
    }
    
    
    func hideTheLabelsAndViews()
    {
        for label in dieLabels { label.hidden = true}
        for view in dieViews { view.hidden = true}
        
        
    }

    func hideViews ()
    {
        for view in dieViews {view.hidden = true}
    }
    
    func hideLabels ()
    {
        for label in dieLabels {label.hidden = true}
    }

    
    @IBAction func dieRoll(sender: UIButton)
    {
        guard numberOfRolls < 6 else {print ("Game Overz");return}
        hideViews()
        
        let randomDieRoll = randomDiceRoll()
        
        unhideViewsWithDieRoll(randomDieRoll)
        updateLabelWithDieRoll(randomDieRoll)
    }
    
    func updateLabelWithDieRoll(number: Int) {
        guard numberOfRolls < 6 else {return}
        
      let label = dieLabels[numberOfRolls]
    label.text = String(number)
        label.hidden = false
        
        numberOfRolls += 1
        
    }
    
    
    func unhideViewsWithDieRoll(number: Int)
    {
        var viewsToUnide: [UIView] = []
        
        
        switch number {
        case 1: viewsToUnide = [middleView]
        case 2: viewsToUnide = [leftTopView, rightBottomView]
        case 3: viewsToUnide = [leftTopView, middleView, rightBottomView]
        case 4: viewsToUnide = [leftTopView, leftBottomView, rightTopView, rightBottomView]
        case 5: viewsToUnide = [leftTopView, leftBottomView, rightTopView, rightBottomView, middleView]
        case 6: viewsToUnide = [leftTopView, leftMiddleView, leftBottomView, rightTopView, rightMiddleView, rightBottomView]
        default: assert(number < 6, "Invalid die roll \(number)")
            
        }
        
        for view in viewsToUnide {
            view.hidden = false
        }
      
    }

 
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int
    {
        return Int(arc4random_uniform(6) + 1)
    }
}
