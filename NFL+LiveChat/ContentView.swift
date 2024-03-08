//
//  ContentView.swift
//  NFL+LiveChat
//
//  Created by Lonzo Hamilton Jr on 3/8/24.
//

//
//  ContentView.swift
//  prayers
//
//  Created by Kaleb Riley on 3/8/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "SvR", ofType: "mp4")!) // Update with your video's name and extension
    )
    var body: some View {
        NavigationView {
            ZStack(alignment:.bottomTrailing){
                VStack {
                    VideoPlayer(player: player)
                        .frame(maxHeight:.infinity)
                    Spacer()
                    Text("Saints Live Chat")
                    .padding(5.0)
                    .foregroundColor(.yellow)
                    ChatView()
                }
                .padding(.bottom, 20)
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .trailing) // Align the button to the right
                .padding()
                .background(Color.black)
                .onAppear {
                    player.play()
                }
                NavigationLink(destination: AIAssistantView()) {
                    Image(systemName: "mic.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.blue)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .padding()
                }
            }
            .navigationBarTitle("Chat")
        }
    }
}
    struct AIAssistantView: View {
        var body: some View {
            Text("AI Assistant View")
        }
    struct AIAssistantButton: View {
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(systemName: "mic.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.blue)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
        }
    }
        func AIAssistantButton(){
            // Add action here for when the button is tapped
            print("AI Assistant activated!")
        }
    
    // A custom SwiftUI view to encapsulate the AVPlayer
    struct VideoPlayer: UIViewRepresentable {
        let player: AVPlayer
        
        func makeUIView(context: Context) -> UIView {
            return PlayerView(player: player)
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            // Not needed for this simple use case
        }
    }
    
    // A basic view that holds the AVPlayerLayer
    class PlayerView: UIView {
        override static var layerClass: AnyClass {
            AVPlayerLayer.self
        }
        
        var playerLayer: AVPlayerLayer {
            layer as! AVPlayerLayer
        }
        
        init(player: AVPlayer) {
            super.init(frame: .zero)
            playerLayer.player = player
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
    #Preview {
        ContentView()
    }
    

