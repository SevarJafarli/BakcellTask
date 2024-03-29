//
//  LoadingActivityIndicator.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 19.03.24.
//


import UIKit

class LoadingActivityIndicator: UIActivityIndicatorView {
    //MARK: Init
    
     init() {
         super.init(style: .large)
        ///is hidden by default
        self.isHidden = true
        self.hidesWhenStopped = true
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: Public
    
    public func startLoading() {
        self.isHidden = false
        self.startAnimating()
    }
    
    public func stopLoading(_ onComplete: @escaping () -> ()) {
        self.stopAnimating()
        onComplete()
    }
}
