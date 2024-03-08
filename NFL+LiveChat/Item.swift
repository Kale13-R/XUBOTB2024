//
//  Item.swift
//  NFL+LiveChat
//
//  Created by Lonzo Hamilton Jr on 3/8/24.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let sender: String
}

struct ChatView: View {
    @State private var messages: [Message] = []
    @State private var newMessageText = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages) { message in
                        Text("\(message.sender): \(message.text)")
                            .padding(5)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
            .frame(maxHeight: .infinity)

            TextField("Type a message", text: $newMessageText, onCommit: sendMessage)
                .padding()
                .background(Color(UIColor.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
        }
        .background(Color.gray)
        .cornerRadius(20.0)
        .navigationBarTitle("Chat")
    }

    func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        messages.append(Message(text: newMessageText, sender: "You"))
        newMessageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
#Preview {
    ChatView()
}
