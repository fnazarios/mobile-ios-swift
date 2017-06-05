//
//  ConfigurationEntity.swift
//  AlliNMobileSwift
//
//  Created by Lucas Rodrigues on 31/05/17.
//  Copyright © 2017 Lucas Rodrigues. All rights reserved.
//
class ConfigurationEntity {
    var deviceToken: String;
    
    init(deviceToken: Data?) throws {
        if let token = deviceToken {
            self.deviceToken = token.map { String(format: "%02.2hhx", arguments: [$0]); }.joined();
            
            if (self.deviceToken.isNullOrEmpty) {
                throw DeviceTokenException.Invalid;
            }
        }
        
        throw DeviceTokenException.Empty;
    }
    
    init(deviceToken: String) throws {
        if (deviceToken.isNullOrEmpty) {
            throw DeviceTokenException.Empty;
        }
        
        self.deviceToken = deviceToken;
    }
}