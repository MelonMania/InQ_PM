//
//  ProjectVC.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/30.
//

import UIKit

class ProjectVC: UIViewController {
    
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var tabPageCollectionView: UICollectionView!
    @IBOutlet weak var highlightView: UIView!
    
    var constraints : [NSLayoutConstraint] = []
    
    var direction = 0 // -1: 왼, 1: 오
    let tabModel: [String] = ["모집중인 프로젝트", "진행중인 프로젝트", "완성된 프로젝트"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setTabPage()
    }
    
    func setTabBar() {
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        let firstIndexPath = IndexPath(item: 0, section: 0)
        
        collectionView(tabCollectionView, didSelectItemAt: firstIndexPath)
        
        tabCollectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .right)
    }
    
    func setTabPage() {
        tabPageCollectionView.delegate = self
        tabPageCollectionView.dataSource = self
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ProjectVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tabModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabCollectionView {
            // 탭바
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCollectionViewCell.reuseIdentifier, for: indexPath) as! TabBarCollectionViewCell
            cell.setTitle(title: tabModel[indexPath.item])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabPageCollectionViewCell.reuseIdentifier, for: indexPath) as! TabPageCollectionViewCell
            cell.setColor(index: indexPath.item)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCollectionView {
            print(indexPath)
            
            guard let cell = tabCollectionView.cellForItem(at: indexPath) as? TabBarCollectionViewCell else {
                NSLayoutConstraint.deactivate(constraints)
                constraints = [
                    highlightView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    highlightView.widthAnchor.constraint(equalToConstant: 80)
                ]
                NSLayoutConstraint.activate(constraints)
                return
            }
            let boundsConvert = cell.convert(cell.bounds, to: nil)
            
            print("---cell bounds")
            print(cell.bounds)
            print("---convert cell bounds")
            print(boundsConvert)
            
            NSLayoutConstraint.deactivate(constraints)
            highlightView.translatesAutoresizingMaskIntoConstraints = false
            constraints = [
                highlightView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                highlightView.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // 페이지 넘길때만
        if scrollView == tabPageCollectionView {
            let index = Int(targetContentOffset.pointee.x / tabPageCollectionView.frame.width)
            print(index)
            
            let indexPath = IndexPath(item: index, section: 0)
            
            tabCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            collectionView(tabCollectionView, didSelectItemAt: indexPath)
            
            if direction > 0 {
                // >>>> 스와이프하면 스크롤은 중앙으로
                tabCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            } else {
                // <<<< 스와이프하면 스크롤은 왼쪽으로
                tabCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView)
        
        if velocity.x < 0 {
            // -: 오른쪽에서 왼쪽 <<<
            direction = -1
        } else if velocity.x > 0 {
            // +: 왼쪽에서 오른쪽 >>>
            direction = 1
        } else {
            
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ProjectVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tabCollectionView {
            let width = 80 + 20 * indexPath.item
            return CGSize(width: width, height: 50)
        } else {
            return collectionView.bounds.size
        }
    }
}
