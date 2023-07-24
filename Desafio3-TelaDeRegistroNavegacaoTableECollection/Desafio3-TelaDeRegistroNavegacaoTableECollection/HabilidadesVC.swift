//
//  HabilidadesVC.swift
//  Desafio3-TelaDeRegistroNavegacaoTableECollection
//
//  Created by Sergio henrique Ferreira on 24/07/23.
//

import UIKit

class HabilidadesVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var teste :[String] = ["swift","kotlin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        
    }
    func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        
        collectionView.register(CustomHabilidadeCell.nib(), forCellWithReuseIdentifier: CustomHabilidadeCell.identifierCollection)
    }
    
}

extension HabilidadesVC: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teste.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vcController = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHabilidadeCell.identifierCollection, for: indexPath) as? CustomHabilidadeCell
        vcController?.setupCollectionCell(nameImage: teste[indexPath.row])
        return vcController ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
}
