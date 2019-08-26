//
//  UIImageView+Extension.swift
//  Demo
//
//  Created by VikasK on 23/08/19.
//  Copyright © 2019 Vikas Kore Software. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    /* If you are using 'Kingfisher' in your project
     func setImage(with urlString: String){
     guard let url = URL.init(string: urlString) else {
     return
     }
     let resource = ImageResource(downloadURL: url, cacheKey: urlString)
     var kf = self.kf
     kf.indicatorType = .activity
     self.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placeholder"))
     }
     */
}
