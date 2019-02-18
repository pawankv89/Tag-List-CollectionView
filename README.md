
Tag List CollectionView
=========

## Simple and Customizable iOS tag list view, in Swift 4.2.
------------
 Added Some screens here.
 
[![](https://github.com/pawankv89/Tag-List-CollectionView/blob/master/images/screen_1.png)]




## Usage
------------
 
Integration Steps

```swift

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

```

There is a sample function in ViewController that you can simply call. 

```swift
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
```


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
