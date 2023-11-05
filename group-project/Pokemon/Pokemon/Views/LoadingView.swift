//
//  LoadingView.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 5.11.2023.
//

import UIKit

final class LoadingView: UIViewController {

    var imageView = UIImageView()
    var bounceTimer: Timer?
    var elapsedTime: TimeInterval = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "bulbasour.png")
        imageView.center = view.center
        self.view.addSubview(imageView)
        view.backgroundColor = .clear

        bounceTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateImage), userInfo: nil, repeats: true)
    }

    @objc func animateImage() {
        let bounceHeight: CGFloat = 20.0

        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: -bounceHeight)
        }, completion: nil)
    }
}

