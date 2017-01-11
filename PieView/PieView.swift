//
//  PieView.swift
//  PieView
//
//  Created by teraomasataka on 2017/01/11.
//  Copyright © 2017年 masataka.terao. All rights reserved.
//

import UIKit

@IBDesignable
class PieView: UIView {

    @IBInspectable var fillColor: UIColor = UIColor.black
    @IBInspectable var startAngle: Double = 0.0
    @IBInspectable var endAngle: Double = 360.0
    
    override func draw(_ rect: CGRect) {
        self.drawPie(rect: rect)
    }
    
    private func drawPie(rect: CGRect) {
        // コンテキストを取得
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        // 色の設定
        context.setFillColor(self.fillColor.cgColor)
        
        // パイの中心位置
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        
        // パイの半径
        let radius = min(rect.width, rect.height) * 0.5
        
        // 開始と終了の角度をラジアンに変換
        let startRadian = CGFloat((self.startAngle - 90) * .pi/180)
        let endRadian = CGFloat((self.endAngle - 90) * .pi/180)
        
        // パイの形を描画
        context.move(to: center)
        context.addArc(center: center, radius: radius, startAngle: startRadian, endAngle: endRadian, clockwise: false)
        context.fillPath()
    }

}
