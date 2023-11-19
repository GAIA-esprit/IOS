//
//  Sprite.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 19/11/2023.
//

import SwiftUI

extension UIImage {
    func sliceSpriteSheet(columns: Int, rows: Int) -> [UIImage] {
        var sprites: [UIImage] = []

        let spriteWidth = self.size.width / CGFloat(columns)
        let spriteHeight = self.size.height / CGFloat(rows)

        for row in 0..<rows {
            for column in 0..<columns {
                let rect = CGRect(x: CGFloat(column) * spriteWidth, y: CGFloat(row) * spriteHeight, width: spriteWidth, height: spriteHeight)
                if let image = self.cgImage?.cropping(to: rect) {
                    sprites.append(UIImage(cgImage: image))
                }
            }
        }

        return sprites
    }
}
