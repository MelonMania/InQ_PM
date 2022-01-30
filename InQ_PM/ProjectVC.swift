//
//  ProjectVC.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/30.
//

import UIKit

class ProjectVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

//MARK: - UIScrollViewDelegate

extension ProjectVC : UIScrollViewDelegate, UIView {
    func setScrollView() {
            scrollView.delegate = self
            scrollView.contentSize.width = self.view.frame.width * 5
            
            self.addChild(RecruitingVC)
            guard let recruitingView = RecruitingVC.view else { return }
        recruitingView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            
            self.addChild(proceedingVC)
            guard let proceedingView = proceedingVC.view else { return }
        proceedingView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            
            self.addChild(doneVC)
            guard let doneView = doneVC.view else { return }
            doneView.frame = CGRect(x: self.view.frame.width * 2, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
          
                    // UIView Extension 사용
            scrollView.addSubviews(kurlyRecommandView, newProductView, bestView, shoppingView, specialView)
    }
}
