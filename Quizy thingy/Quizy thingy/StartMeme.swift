//
//  SwiftUIView.swift
//  Quizy thingy
//
//  Created by Jhala family on 2/7/23.
//

import SwiftUI

struct StartMeme: View {
    var body: some View {
        VStack{
            Text("Have you ever felt like you were no being productive! Well this interactive app will be of much help")
                .font(.title)
                .multilineTextAlignment(.center)
                Spacer()
        }
        VStack{
            Image("Nevergonnagiveyouup")
                .resizable()
                .scaledToFit()
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StartMeme()
    }
}
