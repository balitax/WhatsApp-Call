//
//  ContentView.swift
//  WhatsApp Call
//
//  Created by Agus Cahyono on 03/03/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var visible = true
    @State private var decline = false
    
    private func animateCallText() {
        withAnimation(Animation.easeInOut.repeatForever()) {
            visible.toggle()
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("avatars")
                    .resizable()
                    .frame(
                        width: 174,
                        height: 174,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, 154)
                
                Text("Skylar Aminoff")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 22)
                
                Text(decline == true ? "Declined" : "Calling...")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 0)
                    .opacity(visible ? 1 : 0)
                
                HStack(spacing: 85) {
                    
                    VStack {
                        
                        Button(action: {
                            self.decline = true
                            SoundManager.playSounds(soundfile: "whatsapp_nokia_tune.mp3")
                        }) {
                            Image("accept_icon")
                                .frame(width: 82, height: 82)
                                .foregroundColor(Color.black)
                                .background(Color("greenAccept"))
                                .clipShape(Circle())
                        }
                        
                        Text("Accept")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.top, 21)
                        
                        
                    }
                    
                    VStack {
                        
                        Button(action: {
                            self.decline.toggle()
                            SoundManager.stopSound()
                        }) {
                            Image("decline_icon")
                                .frame(width: 82, height: 82)
                                .foregroundColor(Color.black)
                                .background(Color("redDecline"))
                                .clipShape(Circle())
                        }
                        
                        Text("Decline")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.top, 21)
                        
                    }
                    
                }
                .padding(.top, 140)
                
            }
            
            
        }
        .onAppear(perform: {
            SoundManager.playSounds(soundfile: "whatsapp_nokia_tune.mp3")
            self.animateCallText()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
