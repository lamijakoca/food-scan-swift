//
//  ContentView.swift
//  Food-Scan
//
//  Created by Mahir Tahirovic on 02/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var scale = false
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            MainView()
        } else {
            VStack{
                VStack{
                    Image("logo1")
                        .resizable()
                        .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .scaleEffect(scale ? 1 : 0.7)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.7)){
                        self.scale = true
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
