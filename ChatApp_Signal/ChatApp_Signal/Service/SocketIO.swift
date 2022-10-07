//
//  SocketIO.swift
//  ChatApp_Signal
//
//  Created by bùi thành công on 18/09/2022.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    let manager: SocketManager = SocketManager(socketURL: URL(string:"http://localhost:5000")!,config: [.log(true),.compress,.reconnects(true),.reconnectWait(1)])
    var socket: SocketIOClient!
    
    let defaultChannel = "chat-app-channel-"
    
    var currentChannel: String?
    
    override init() {
        super.init()
        socket = manager.defaultSocket
        socket.on(clientEvent: .connect, callback: {[weak self] _, _ in
            if let currentChannel = self?.currentChannel, !currentChannel.isEmpty {
                self?.subcribe(channel: currentChannel)
            }
        })
        socket.on("get_message", callback: {_, _ in })
    }
    
    func connect() {
        socket.connect()
    }
    
    func sendMessage(channel: String, param: String) {
        socket.emit("send_message", defaultChannel+channel, param)
    }
    
    func subcribe(channel: String) {
        currentChannel = channel
        socket.emit("subcribe_channel", defaultChannel+channel)
    }
    
    
    func unSubcribe(channel: String) {
        currentChannel = nil
        socket.emit("unSubcribe_channel", defaultChannel+channel)
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
}
