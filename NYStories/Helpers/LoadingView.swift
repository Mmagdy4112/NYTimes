//
//  SpinnerViewController.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/24/21.
//

import UIKit

class LoadingView {
    
    // MARK: - Variables
    private var containerView = UIView()
    private var progressView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    
    static var shared = LoadingView()
    
    // To close for instantiation
    private init() {}
    
    // MARK: - Functions
    func startAnimating(view: UIView = (UIApplication.shared.keyWindow?.rootViewController?.view)!) {
        containerView.center = view.center
        containerView.frame = view.frame
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.5)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = containerView.center
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        activityIndicator.center = CGPoint(x: progressView.bounds.width/2, y: progressView.bounds.height/2)
        
        activityIndicator.style = .whiteLarge
        
        view.addSubview(containerView)
        containerView.addSubview(progressView)
        progressView.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    /// animate UIActivityIndicationView without blocking UI
    func startSmoothAnimation(view: UIView = (UIApplication.shared.keyWindow?.rootViewController?.view)!) {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        activityIndicator.center = view.center
        activityIndicator.style = .whiteLarge
        activityIndicator.color = UIColor.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopAnimatimating() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
