//
//  ContentView.swift
//  NotificationAnimationDemo
//
//  Created by Thongchai Subsaidee on 8/9/2564 BE.
//

import SwiftUI

//https://youtu.be/pjfSXDZfDWE

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
                .ignoresSafeArea(.all)
            
            NoteView()
            
            BellView()
                .offset(y: -65)

            CountView()
                .offset(x: 50, y: -155)
            
            VStack {
                Spacer()
                Text("Notificatoin Animation")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NoteView: View {
    @State private var namearrow = false
    var body: some View {
        ZStack {
            Image(systemName: "location.north.fill")
                .resizable()
                .foregroundColor(.green)
                .offset(x: 100)
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                .frame(width: 40, height: 40, alignment: .center)
                .rotationEffect(.degrees(namearrow ? -360 : 0))
                .animation(Animation.easeInOut(duration: 5).repeatCount(1))
                .onAppear{
                    self.namearrow.toggle()
                }
            
        }
        .rotationEffect(.degrees(260))
    }
}

struct BellView: View {
    @State private var isAnimation: Bool = false
    var body: some View {
        ZStack {
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 180, height: 180, alignment: .center)
                .foregroundColor(.yellow)
                .shadow(color: .gray, radius: 5, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(isAnimation ? 0 : 10))
                .animation(Animation
                            .interpolatingSpring(stiffness: 150, damping: 5)
                            .repeatCount(1)
                            .delay(4)
                )
                .onAppear{
                    self.isAnimation.toggle()
                }
        }
    }
}


struct CountView: View {
    @State private var count: Bool = false
    var body: some View {
        ZStack {
            
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
            
            Text("5")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                        
        }
        .opacity(count ? 1 : 0)
        .rotationEffect(.degrees(count ? 0 : 10))
        .animation(
            Animation
                .interpolatingSpring(stiffness: 150, damping: 5)
                .repeatCount(1)
                .delay(5)
        )
        .onAppear{
            self.count.toggle()
        }
    }
}
