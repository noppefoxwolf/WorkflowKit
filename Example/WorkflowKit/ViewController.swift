//
//  ViewController.swift
//  WorkflowKit
//
//  Created by noppefoxwolf on 09/25/2018.
//  Copyright (c) 2018 noppefoxwolf. All rights reserved.
//

import UIKit
import WorkflowKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  @IBOutlet private weak var collectionView: UICollectionView!
  private let urls = [
    Bundle.main.url(forResource: "Bitcoin Price", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "Check If Email Address Has Been Pwned", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "Get File Size", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "New Link Post in Ulysses", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "PDF from Markdown", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "Siri News Reader", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "Stop Current Toggl Timer", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "ShortcutShare", withExtension: "shortcut")!,
    Bundle.main.url(forResource: "Flashlight Morse", withExtension: "shortcut")!,
  ]
  private lazy var shotcuts = self.urls.compactMap({ Shortcut(url: $0) })
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(WorkflowCell.self, forCellWithReuseIdentifier: "cell")
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return shotcuts.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WorkflowCell
    cell.configure(shotcuts[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width / 2.0 - 15.0, height: collectionView.bounds.width * 0.3)
  }
}

class WorkflowCell: UICollectionViewCell {
  private var gradientLayer: CALayer? = nil
  private lazy var label: UILabel = .init(frame: bounds)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = .white
    contentView.addSubview(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(_ shotcut: Shortcut) {
    gradientLayer?.removeFromSuperlayer()
    gradientLayer = GradientLayerFactory.make(from: shotcut.workflow.icon.startColor)
    gradientLayer?.frame = bounds
    layer.insertSublayer(gradientLayer!, at: 0)
    label.text = shotcut.name
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 16.0
    layer.masksToBounds = true
    label.frame = bounds
  }
}

