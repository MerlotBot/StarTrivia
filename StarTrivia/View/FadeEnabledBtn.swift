//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by Antonakakis Nikolaos on 24.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import UIKit

// we subclassed UIButton
class FadeEnabledBtn : UIButton {
    // we overridden isEnabled property and we put a property observer
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
                
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
    
}
