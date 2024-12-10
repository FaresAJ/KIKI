//
//  UIImageViewExtension.swift
//  KIKI
//
//  Created by Fares Ajimi on 18/11/2021.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setImageWithUrl(url: String, placeholder: UIImage? = nil, radius: CGFloat) {
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: radius)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
