//
//  AppDelegate.swift
//  ZHShowDesktop
//
//  Created by 钟桓 on 15/3/3.
//  Copyright (c) 2015年 钟桓. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var yes: NSMenuItem!
    
    @IBOutlet weak var no: NSMenuItem!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    var dts = DesktopStartup()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        //icon showed in system status bar
        let icon = NSImage(named: "desktop")
        icon?.setTemplate(true)
        statusItem.image = icon
        
        // define the action when the icon was clicked!
        statusItem.action = Selector("goBackDesktop:")
        
        DesktopStartup()
        
        if let inStartup = userDefaults.valueForKey("inStartup") {
            // do something here when a inStartup exists
            
            if inStartup as Bool{
                yes.title = "是 √"
            }else{
                no.title = "否 √"
            }
            
            dts.toggleLaunchAtStartup(inStartup as Bool)
            
        }
        else {
            // no inStartup exists
            userDefaults.setBool(true, forKey: "inStartup")
            userDefaults.synchronize()
            dts.toggleLaunchAtStartup(true)
            yes.title = "是 √"
        }
        
        
        
    }
    
    func goBackDesktop(sender : AnyObject){
        println("click!")
        SimulateKeyBoardEvent.goBackToDesktop()
    }
    
    @IBAction func yesItemClicked(sender: NSMenuItem) {
        yes.title = "是 √"
        no.title = "否"
        userDefaults.setBool(true, forKey: "inStartup")
        userDefaults.synchronize()
        
        dts.toggleLaunchAtStartup(true)
        
    }
    
    @IBAction func noItemClicked(sender: NSMenuItem) {
        no.title = "否 √"
        yes.title = "是"
        userDefaults.setBool(false, forKey: "inStartup")
        userDefaults.synchronize()
        
        dts.toggleLaunchAtStartup(false)
        
    }

}

