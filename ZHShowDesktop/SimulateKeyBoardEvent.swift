//
//  SimulateKeyBoardEvent.swift
//  ZHShowDesktop
//
//  Created by 钟桓 on 15/3/3.
//  Copyright (c) 2015年 钟桓. All rights reserved.
//

import Foundation

class SimulateKeyBoardEvent {
    
    class func goBackToDesktop(){
        
        //simulate option+command+h+m 
        
        var src = CGEventSourceCreate(CGEventSourceStateID(kCGEventSourceStateHIDSystemState)).takeRetainedValue()
        
        let cmdDown = CGEventCreateKeyboardEvent(src, 0x37, true).takeRetainedValue()
        let cmdUp = CGEventCreateKeyboardEvent(src, 0x37, false).takeRetainedValue()
        CGEventSetFlags(cmdDown, CGEventFlags(kCGEventFlagMaskCommand))
        CGEventSetFlags(cmdUp, CGEventFlags(kCGEventFlagMaskCommand))
        
        let optionDown = CGEventCreateKeyboardEvent(src, 0x3A, true).takeRetainedValue()
        let optionUp = CGEventCreateKeyboardEvent(src, 0x3A, false).takeRetainedValue()
        CGEventSetFlags(optionDown, CGEventFlags(kCGEventFlagMaskAlternate))
        CGEventSetFlags(optionUp, CGEventFlags(kCGEventFlagMaskAlternate))
        
        let hDown = CGEventCreateKeyboardEvent(src, 0x04, true).takeRetainedValue()
        let hUp = CGEventCreateKeyboardEvent(src, 0x04, false).takeRetainedValue()
        CGEventSetFlags(hDown, CGEventFlags(kCGEventFlagMaskCommand ^ kCGEventFlagMaskAlternate))
        CGEventSetFlags(hUp, CGEventFlags(kCGEventFlagMaskCommand ^ kCGEventFlagMaskAlternate))
        
        let mDown = CGEventCreateKeyboardEvent(src, 0x2E, true).takeRetainedValue()
        let mUp = CGEventCreateKeyboardEvent(src, 0x2E, false).takeRetainedValue()
        CGEventSetFlags(mDown, CGEventFlags(kCGEventFlagMaskCommand ^ kCGEventFlagMaskAlternate))
        CGEventSetFlags(mUp, CGEventFlags(kCGEventFlagMaskCommand ^ kCGEventFlagMaskAlternate))
        
        let loc = CGEventTapLocation(kCGHIDEventTap)
        CGEventPost(loc, optionDown)
        CGEventPost(loc, cmdDown)
        CGEventPost(loc, hDown)
        CGEventPost(loc, mDown)
        
        CGEventPost(loc, mUp)
        CGEventPost(loc, hUp)
        CGEventPost(loc, optionUp)
        CGEventPost(loc, cmdUp)
        
    }
    
}