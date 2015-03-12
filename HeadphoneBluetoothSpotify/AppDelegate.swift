//
//  AppDelegate.swift
//  HeadphoneBluetoothSpotify
//
//  Created by Dasilva, Maxwell on 3/12/15.
//  Copyright (c) 2015 maxwell dasilva. All rights reserved.
//

import Cocoa
import ScriptingBridge

extension SBApplication{
    func nextTrack() {}
    func previousTrack() {}
    func playpause(){}
    
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var spotifyClient:SBApplication? = nil;

    override func awakeFromNib() {
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.image = NSImage(named: "headphone")
        //Menu items
        statusBarItem.highlightMode = true
        menu.addItem(createMenuItem("Toggle Play", action: "controlSpotify:", tag:1))
        menu.addItem(createMenuItem("Next Track", action: "controlSpotify:", tag:2))
        menu.addItem(createMenuItem("Previous Track", action: "controlSpotify:", tag:3))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(createMenuItem("Quit", action: "exitApp:", tag:4))

    }

    func createMenuItem(title:String, action:String, tag:Int) -> NSMenuItem {
        var item : NSMenuItem = NSMenuItem()
        item.enabled = true
        item.title = title
        item.tag = tag
        item.action = Selector(action)
        item.keyEquivalent = ""
        return item
    }
    
    func exitApp(sender:AnyObject){
        exit(0)
    }
    
    func controlSpotify(sender:AnyObject){
        switch (sender as NSMenuItem).tag{
        case 1:
            spotifyClient?.playpause()
        case 2:
            spotifyClient?.nextTrack()
        case 3:
            spotifyClient?.previousTrack()
        default:
            println("Command not found")
        }
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        startSpotifyClient()
    }

    func applicationWillTerminate(aNotification: NSNotification) {

    }

    func startSpotifyClient(){
        spotifyClient = SBApplication(bundleIdentifier: "com.spotify.client")
        NSEvent.addGlobalMonitorForEventsMatchingMask(.KeyDownMask | .SystemDefinedMask, handler: { event in
            let keyCode = ((event.data1 & 0xFFFF0000) >> 16)
            let keyFlags = (event.data1 & 0x0000FFFF)
            if(keyCode == 10 && keyFlags == 6972 && self.spotifyClient != nil){
                switch event.data2{
                case 786613:
                    self.spotifyClient?.nextTrack()
                case 786614:
                    self.spotifyClient?.previousTrack()
                case 786637:
                    self.spotifyClient?.playpause()
                default:
                    println("key not supported %d", event.data2)
                }
            }
        })
    }
}

