//
//  ViewController.swift
//  PhotoViewer
//
//  Created by くりすせいま on 2020/10/08.
//  Copyright © 2020 せいま. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //イメージビューのプロパティ宣言
    var imageView: UIImageView!
    
    //スクロールビューのプロパティ宣言
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールビューを作成
       scrollView = UIScrollView(frame: CGRect(origin: .zero, size: view.bounds.size))
        
        //スクロールビューに背景色を設定
        scrollView.backgroundColor = UIColor.gray

        //イメージビューの作成
        imageView = UIImageView(image: UIImage(named: "fox") )

        //スクロールできる範囲を設定
        scrollView.contentSize = imageView.bounds.size
        
        //スクロールビューのデリゲートになる
        scrollView.delegate = self
        
        //ズームの倍率を設定する
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 5.0
        
        //画面を開いた時に画像全体を表示させる設定
        let width_scale = scrollView.frame.width / imageView.frame.size.width
        let height_scale = scrollView.frame.height / imageView.frame.size.height

        let scale = max(width_scale, height_scale)

        scrollView.zoomScale = scale
        
        //スクロールビューにサブビューを追加する
        scrollView.addSubview(imageView)

        //ルートビューに追加する
        view.addSubview(scrollView)
    }
    
    //ズームの実装
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    //contentInsetの更新
    func scrollViewDidZoom(_ scrollView: UIScrollView) {

    }
    
    //位置の調整をしてくれるメソッド
    func updateContentInset() {
        let widthInset = max((scrollView.frame.size.width - imageView.frame.size.width) / 2, 0)
        let heightInset = max((scrollView.frame.size.height - imageView.frame.size.height) / 2, 0)
        scrollView.contentInset = .init(top: heightInset,
                                        left: widthInset,
                                        bottom: heightInset,
                                        right: widthInset)
    }
    
    //ズーム後の余白を更新する
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateContentInset()
    }
}

