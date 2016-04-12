//
//  AutoCoding.swift
//  AutoCoding
//
//  Created by Korey Hinton on 1/30/15. Updated 4/10/15
//  Copyright (c) 2015 Korey Hinton. All rights reserved.
//

import Foundation

class AutoCoded: NSObject, NSCoding {
    
    private let AutoCodingKey = "autoEncodings"
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        
        let decodings = aDecoder.decodeObjectForKey(AutoCodingKey) as! NSArray
        setValue(decodings, forKey: AutoCodingKey)
        
        for decoding in decodings {
            setValue(aDecoder.decodeObjectForKey(decoding as! String)!, forKey: decoding as! String)
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(valueForKey(AutoCodingKey), forKey: AutoCodingKey)
        for encoding in valueForKey(AutoCodingKey) as! NSArray {
            aCoder.encodeObject(valueForKey(encoding as! String)!, forKey: encoding as! String)
        }
    }
}
