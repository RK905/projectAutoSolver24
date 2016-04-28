//
//  solutionsCV.swift
//  projectAutoSolver24
//
//  Created by x on 4/27/16.
//  Copyright © 2016 TeamAutoSolver24. All rights reserved.
//

import UIKit

class solutionsCV: UICollectionViewController {

    @IBOutlet var solutionsCVSB: UICollectionView!
    
    var numberFirstPass = [String]()
    var numberSecondPass = [String]()
    var numberThirdPass = [String]()
    var numberFourthPass = [String]()
    var numberFifthPass = [String]()
    var numberSixthPass = [String]()
    
    var operationFirstPass = [String]()
    var operationSecondPass = [String]()
    var operationThirdPass = [String]()

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberFirstPass.count: \(numberFirstPass.count)")
        return numberFirstPass.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: solutionCell = collectionView.dequeueReusableCellWithReuseIdentifier("solutionCell", forIndexPath: indexPath) as! solutionCell
        
        print("indexPath.row - cells: \(indexPath.row)")
        
        cell.numberFirst.text = numberFirstPass[indexPath.row]
        cell.numberSecond.text = numberSecondPass[indexPath.row]
        cell.numberThird.text = numberThirdPass[indexPath.row]
        cell.numberFourth.text = numberFourthPass[indexPath.row]
        cell.numberFifth.text = numberFifthPass[indexPath.row]
        cell.numberSixth.text = numberSixthPass[indexPath.row]
        
        cell.operationFirst.text = operationFirstPass[indexPath.row]
        cell.operationSecond.text = operationSecondPass[indexPath.row]
        cell.operationThird.text = operationThirdPass[indexPath.row]
        
        return cell
    }
    
}
