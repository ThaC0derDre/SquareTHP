//
//  EmptyPageView.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/6/22.
//

import SwiftUI
import Lottie

struct EmptyPageView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: .zero)
        
        let lottieAnimationView = LottieAnimationView(name: "empty-state", bundle: Bundle.main)
        
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.play()
        
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
        
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
