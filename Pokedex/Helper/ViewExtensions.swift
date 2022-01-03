//
//  ViewExtensions.swift
//  Pokedex
//
//  Created by Simon Deutsch on 23.12.21.
//

import SwiftUI

// allows for any placeholder view when data is empty
extension View {
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

// uses placeholder and allows for textfield placholder color to be set
extension View {
    func placeholder(_ text: String, color: Color, when shouldShow: Bool, alignment: Alignment = .leading) -> some View {
        placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(color) }
    }
}

// 8bit font wrapper
extension View {
    func font8bit(size: CGFloat) -> some View {
        font(.custom("Connection", size: size))
    }
}


// grayscale bool
extension View {
    func grayscale(_ grayscale: Bool) -> some View {
        self.grayscale(grayscale ? 0 : 1)
    }
}

// Line Shape 
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

extension View {
    func borderBottom() -> some View {
        self.overlay {
            VStack{
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                    .offset(x: 0, y: 18)
            }
        }
    }
}
