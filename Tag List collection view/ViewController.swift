//
//  ViewController.swift
//  Tag List collection view
//
//  Created by Pawan kumar on 15/02/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, HeaderCellDelegate {

    @IBOutlet var collectionView: UICollectionView?
    
    var layout: UICollectionViewFlowLayout!
    var listItems: Array<Any>!
    
    //By Default
    var displayItems: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Animals_name: String = "Animals Name"
        let Animals_Names_List = ["Ant", "Bear", "Buffalo", "Butterfly", "Camel", "Cat", "Chameleon", "Chimpanzee", "Cow", "Crab", "Crocodile", "Deer", "Dog", "Donkey", "Elephant", "Fox", "Frog", "Goat", "Gorilla", "Hippopotamus", "Horse", "Jackal", "Lion", "Lizard", "Mongoose", "Monkey", "Mosquito", "Mouse", "Ox", "Pig", "Polar Bear", "Rabbit", "Rhinoceros", "Sheep", "Snail" ,"Snake", "Spider", "Squirrel", "Tiger", "Turtle", "Wolf", "Giraffe", "Zebra"]
        
        let Dry_Fruits_Name: String = "Dry fruits"
        let Dry_Fruits_Names_List = ["Almond", "Anise", "Apricot", "Arrowroot", "Betel-nut", "Cantaloupe Seeds", "Cashew nut", "Chestnut", "Coconut", "Cudpahnut", "Currant", "Dates Dried", "Dates", "Fig", "Flax seeds", "Groundnuts, Peanuts,Lotus Seeds Pop,Gorgon Nut Puffed Kernel", "Nut, Walnuts", "Pine Nut", "Pistachio", "Prunes", "Pumpkin Seeds", "Saffron", "Sesame Seeds", "Sugar candy", "Watermelon Seeds"]
        
        let Params_Animals:[String: Any] = ["title": Animals_name, "list": Animals_Names_List]
        let Params_Dry_Fruits:[String: Any] = ["title": Dry_Fruits_Name, "list": Dry_Fruits_Names_List]
        
        self.listItems = [Params_Animals,Params_Dry_Fruits]
        
        //Register Tag Cell
        let nibName = UINib(nibName: TagCell.reuseIdentifierString, bundle:nil)
        collectionView!.register(nibName, forCellWithReuseIdentifier: TagCell.reuseIdentifierString)
    
        // Do any additional setup after loading the view, typically from a nib.
        layout  = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collectionView!.backgroundColor = UIColor.white
        collectionView?.collectionViewLayout = layout
        
        let headerNib = UINib.init(nibName: HeaderCell.reuseIdentifierString, bundle: nil)
        collectionView?.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseIdentifierString)
        /*
        let footerNib = UINib.init(nibName: HeaderCell.reuseIdentifierString, bundle: nil)
        collectionView?.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HeaderCell.reuseIdentifierString)
        */
    }
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return listItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let itemsObject: [String: Any] = listItems[section] as! [String: Any]
        //let title: String = itemsObject["title"] as! String
        let items: Array<Any> = itemsObject["list"] as! Array<Any>
        
        return (displayItems == true) ? items.count:  10
        
       // return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView: HeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifierString, for: indexPath as IndexPath) as! HeaderCell
            
            //headerView.backgroundColor = UIColor.lightGray
            
            let itemsObject: [String: Any] = listItems[indexPath.section] as! [String: Any]
            let title: String = itemsObject["title"] as! String
            headerView.titleLabel.text = title
            
            headerView.delegate = self
            
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
           
            //For Footer
            let footerView: HeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifierString, for: indexPath as IndexPath) as! HeaderCell
            
            //footerView.backgroundColor = UIColor.gray
            let itemsObject: [String: Any] = listItems[indexPath.section] as! [String: Any]
            let title: String = itemsObject["title"] as! String
            footerView.titleLabel.text = title
            
            return footerView
            
        default:
            //assert(false, "Unexpected element kind")
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
       return CGSize.init(width: collectionView.bounds.width, height: 50.0)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSize.init(width: collectionView.bounds.width, height: 50.0)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifierString, for: indexPath) as! TagCell
        
        //For User Call Background color
        //cell.backgroundColor = self.randomColor()
        
        let itemsObject: [String: Any] = listItems[indexPath.section] as! [String: Any]
        let items: Array<Any> = itemsObject["list"] as! Array<Any>
        
        cell.titleLabel?.text = items[indexPath.row] as? String
        cell.titleLabel?.numberOfLines = 0
    
        //Cell Corner Radius
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = cell.frame.size.height / 2
        
        return cell
    }
    
    // custom function to generate a random UIColor
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 0.50)
    }
    
    
    //Use for size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsObject: [String: Any] = listItems[indexPath.section] as! [String: Any]
        let items: Array<Any> = itemsObject["list"] as! Array<Any>
        let name: String = items[indexPath.row] as! String
    
        let size: CGSize = name.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0)])
        
        let sizeNew: CGSize = CGSize.init(width:((size.width  > collectionView.frame.size.width) ? collectionView.frame.size.width - 20 : size.width), height: size.height)

        return sizeNew
    }
    
    func headerSeeMoreTap(_ sender: HeaderCell) {
        
        if (displayItems == false) {
            
            displayItems = true
            
        } else {
            
            displayItems = false
        }
        
        self.collectionView?.reloadData()
    }
}
