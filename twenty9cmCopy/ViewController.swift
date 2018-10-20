//
//  ViewController.swift
//  twenty9cmCopy
//
//  Created by tax_k on 18/10/2018.
//  Copyright © 2018 tax_k. All rights reserved.
//

import UIKit

struct scrollViewDataStruct {
    let title:String?
    let image:UIImage?
}

class ViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollViewData = [scrollViewDataStruct]()
    var viewTagVal = 10
    var tagValue = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        scrollViewData = [scrollViewDataStruct.init(title: "Venom Poster1", image: #imageLiteral(resourceName: "venom.jpg")),
                          scrollViewDataStruct.init(title: "Venom Poster2", image: #imageLiteral(resourceName: "venom2.jpg"))]
        
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(scrollViewData.count)
        scrollView.backgroundColor = UIColor.lightGray
        var i = 0
        for data in scrollViewData {
           
            let view = CustomView(frame: CGRect(x: (self.scrollView.frame.width * CGFloat(i)), y: 80, width: self.scrollView.frame.width, height: self.scrollView.frame.height))
            view.tag = i + viewTagVal
            view.imageView.image = data.image
            self.scrollView.addSubview(view)
            
            let label = UILabel(frame: CGRect.init(origin: CGPoint.init(x: view.center.x, y: 200), size: CGSize.init(width: 0, height: 40)))
            label.text = data.title
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = UIColor.white
            label.tag =  i + tagValue
            label.sizeToFit()
            
            if i == 0 {
                label.center.x = view.center.x
            }else {
                label.center.x = view.center.x - self.scrollView.frame.width / 2
            }
            
            self.scrollView.addSubview(label)
            
            i += 1
        }
        
    }
    
    /// set horizontal gesture to control Seek
    ///
    /// - Parameter: (recognizer: PangestureRecognizer)
    /// - Returns: nope
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView {
            for i in 0..<scrollViewData.count {
                let label = scrollView.viewWithTag(i+tagValue) as! UILabel
                let view = scrollView.viewWithTag(i + viewTagVal) as! CustomView
                let scrollContentOffset = scrollView.contentOffset.x + self.scrollView.frame.width
                
                var viewOffset = (view.center.x - scrollView.bounds.width / 4 ) - scrollContentOffset
                label.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset) / 2)
            }
        }
    }
}

class CustomView: UIView {
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("fatal Error")
    }
}
