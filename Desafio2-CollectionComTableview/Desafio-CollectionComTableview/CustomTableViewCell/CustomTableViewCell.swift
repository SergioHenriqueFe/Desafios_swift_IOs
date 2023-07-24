//
//  CustomTableViewCell.swift
//  Desafio-CollectionComTableview
//
//  Created by Sergio henrique Ferreira on 17/07/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colletionView: UICollectionView!
    
    var listCar :[String] = ["car1","car2","car3","car4"]
    
    static let identifier :String = "CustomTableViewCell"
    static func nib()->UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
        
    }
    
    func configCollectionView(){
        colletionView.delegate = self
        colletionView.dataSource = self
        if let layout = colletionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection =  .horizontal
            layout.estimatedItemSize = .zero
        }
        colletionView.register(CustomCollectionViewCell.nibCollectionView(),forCellWithReuseIdentifier: CustomCollectionViewCell.identifierCollection)
        
    }

  
    
}

extension CustomTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifierCollection, for: indexPath) as? CustomCollectionViewCell
        cell?.setupCell(nameImage: listCar[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 153)
    }
    
    
    
}
