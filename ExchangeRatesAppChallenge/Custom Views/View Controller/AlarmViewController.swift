//
//  AlarmViewController.swift
//  ExchangeRatesAppChallenge
//
//  Created by Ana Caroline de Souza on 28/03/20.
//  Copyright © 2020 Ian e Leo Corp. All rights reserved.
//

import UIKit

enum Section {
    case main
}

class AlarmViewController: UIViewController {

    var collectionView: UICollectionView!
    var viewModel: AlarmViewModel!
    var dataSource : UICollectionViewDiffableDataSource<Section,Alarm>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setuoViewController()
        
        viewModel = AlarmViewModel()

        setupCollectionView()
        
        setupConstraints()
        
        configureDataSource()
        
        addAlarm()
        updateData(on: viewModel.getAlarms())
        
    }

    fileprivate func setuoViewController() {
        view.backgroundColor = .purple
        title = "Rate Alarms"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm))
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AlarmCardViewCell.self, forCellWithReuseIdentifier: AlarmCardViewCell.reuseID)
        view.addSubview(collectionView)
        
    }
    
     func createThreeColumnFlowLayout()-> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        return flowLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section,Alarm>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, alarm) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCardViewCell.reuseID, for: indexPath) as? AlarmCardViewCell
            cell?.set(alarm) //configuring cell
            return cell
        })
    }
    
    func updateData(on followers: [Alarm]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Alarm>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.getAlarms())
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    @objc func addAlarm() {
        let newAlarm = Alarm(price: 12.3,
                             baseCurrency: .BRL ,
                             targeCurrency: .DOL,
                             operation: .more)
        
        viewModel.addAlarm(newAlarm)
        updateData(on: viewModel.getAlarms())
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
         collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
