//
//  MainPageTitleView.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 5.11.2023.
//

import UIKit

final class MainPageTitleView: UIView {

    let imgPoke: UIImageView = {
        let image = UIImage(named: "Title.png")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame:CGRect){
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        addSubview(imgPoke)
        self.imgPoke.frame = bounds
    }
}

class TitleButton: UIBarButtonItem {
    let view: MainPageTitleView = {
        let view = MainPageTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()




    func configure() {
     
    }
}
