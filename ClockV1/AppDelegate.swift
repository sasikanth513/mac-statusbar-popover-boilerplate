//
//  AppDelegate.swift
//  ClockV1
//
//  Created by Sasikanth Dronavalli on 14/07/18.
//  Copyright © 2018 Sasikanth Dronavalli. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var sItem : NSStatusItem? = nil;
    
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        //initializing status item
        sItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        sItem?.button?.title = "Clock"
        sItem?.button?.action = #selector(AppDelegate.togglePopover(_:))
        
        popover.animates = false
        
        // attaching view controller to popover
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        
        guard let vc = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "ViewController")) as? ViewController
            else { return }
        
        popover.contentViewController = vc;
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // MARK - popover methods
    
    func showPopover(_ sender: AnyObject?) {
        if let button = sItem?.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            popover.behavior = .transient
        }
    }
    
    func closePopover(_ sender: AnyObject?) {
        popover.performClose(sender);
    }
    
    
    @objc func togglePopover(_ sender: AnyObject) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    

}

