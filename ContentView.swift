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
        VStack {
            VideoPlayer(player: player)
                .frame(height: 250)

            Spacer()
            ChatView()
        }
        .padding()
        .onAppear {
            player.play()
        }
    }
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

#Preview {
    ContentView()
}
