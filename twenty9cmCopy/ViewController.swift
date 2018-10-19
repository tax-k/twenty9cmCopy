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

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollViewData = [scrollViewDataStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollViewData = [scrollViewDataStruct.init(title: "pic1", image: UIImage(named: "venom")),
                          scrollViewDataStruct.init(title: "pic2", image: UIImage(named: "venom2"))]
        
        for name in scrollViewData {
            
        }
        
    }
    
    /// set horizontal gesture to control Seek
    ///
    /// - Parameter: (recognizer: PangestureRecognizer)
    /// - Returns: nope
}

class CustomView: UIView {
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.blue
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
