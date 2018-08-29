//
//  Nav.swift
//  Summon
//
//  Created by eon on 29/08/2018.
//  Copyright © 2018 eon. All rights reserved.
//

import Foundation

//enum ViewType{
//    case receive
//    enum Send{
//        case clipboard(String)
//        case file(String)
//        //case current//don't change state, use the one that it is right now
//    }
//    case send(Send)
//}

enum ViewType {
    case setup
    case send
    case receive
    case response
    case receiveStep
}
