//
//  LottieView.swift
//  pomodoreSG
//
//  Created by MacBook Air on 07/03/23.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let loopMode: LottieLoopMode
    var name: String
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}
