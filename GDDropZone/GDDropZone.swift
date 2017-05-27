//
//  GDDropZone.swift
//  GDDropZone
//
//  Created by Ali Can Bardakci on 27/05/2017.
//  Copyright © 2017 Tavsanlar AS. All rights reserved.
//

import Cocoa

protocol GDDropZoneDelegate {
    func dragDidEnter(dragInfo: NSDraggingInfo, dropZone: GDDropZone)
    func dragDidExit(dragInfo: NSDraggingInfo?, dropZone: GDDropZone)
    func dragDidEnd(dragInfo: NSDraggingInfo?, dropZone: GDDropZone)
    func dragDidDrop(dragInfo: NSDraggingInfo, dropZone: GDDropZone) -> Bool!
}

public class GDDropZone: NSView {

    var delegate: GDDropZoneDelegate!
    
    func registerDrag (forTypes types: [String]? = nil) {
        self.wantsLayer = true
        var types = types
        
        if types == nil {
            types = [NSFilenamesPboardType, NSURLPboardType, NSStringPboardType, NSFilesPromisePboardType, NSPasteboardTypePNG, kUTTypeJPEG as String, kUTTypeGIF as String]
        }
        
        self.register(forDraggedTypes: types!)
    }
    
    init(withTypes types:[String], frame: NSRect) {
        super.init(frame: frame)
        self.registerDrag(forTypes: types)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.registerDrag()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.registerDrag()
    }
    
    override public func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override public func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        self.delegate.dragDidEnter(dragInfo: sender, dropZone: self)
        return .copy
    }
    
    override public func draggingExited(_ sender: NSDraggingInfo?) {
        self.delegate.dragDidExit(dragInfo: sender, dropZone: self)
    }
    
    override public func draggingEnded(_ sender: NSDraggingInfo?) {
        self.delegate.dragDidEnd(dragInfo: sender, dropZone: self)
    }
    
    override public func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return self.delegate.dragDidDrop(dragInfo: sender, dropZone: self)
    }
    
}
