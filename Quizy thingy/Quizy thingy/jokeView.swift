//
//  jokeView.swift
//  Quizy thingy
//
//  Created by Jhala family on 3/7/23.
//

import SwiftUI

struct jokeView: View {
    var body: some View {
        VStack{
            Image("memeofprogamming")
                .resizable()
                .scaledToFit()
        }
        
    }
}

struct jokeView_Previews: PreviewProvider {
    static var previews: some View {
        jokeView()
    }
}
