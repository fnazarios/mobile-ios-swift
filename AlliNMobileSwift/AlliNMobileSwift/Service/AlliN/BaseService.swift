//
//  BaseService.swift
//  AlliNMobileSwift
//
//  Created by Lucas Rodrigues on 12/06/17.
//  Copyright © 2017 Lucas Rodrigues. All rights reserved.
//
class BaseService {
    func sendCallback(_ responseEntity: ResponseEntity?, _ httpRequestError: HttpRequestError?, sendOnlyError: Bool = false, completion: ((Any?, HttpRequestError?) -> Void)?) {
        guard let response = responseEntity else {
            completion?(nil, httpRequestError);
            
            return;
        }
        
        let error = response.error ?? true
        
        if (!error) {
            if (!sendOnlyError) {
                completion?(response.message, nil);
            }
        } else {
            completion?(response.message, HttpRequestError.WebServiceError);
        }
    }
}
