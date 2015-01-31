//
//  AutoCoding.swift
//  AutoCoding
//
//  Created by Korey Hinton on 1/30/15.
//  Copyright (c) 2015 Korey Hinton. All rights reserved.
//

import Foundation

protocol AutoCoding {
    var autoEncodings: [String] { get set }
}

class AutoCoded: NSObject, NSCoding {
    
    private let AutoCodingKey = "autoEncodings"

    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init()
        
        let decodings = aDecoder.decodeObjectForKey(AutoCodingKey) as [String]
        setValue(decodings, forKey: AutoCodingKey)
        
        for decoding in decodings {
            setValue(aDecoder.decodeObjectForKey(decoding), forKey: decoding)
        }
        

    }
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(valueForKey(AutoCodingKey), forKey: AutoCodingKey)
        
        for encoding in valueForKey(AutoCodingKey) as [String] {
            aCoder.encodeObject(valueForKey(encoding), forKey: encoding)
        }
    }
}
