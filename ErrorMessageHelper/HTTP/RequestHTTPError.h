//
//  RequestHTTPError.h
//  ErrorMessage
//
//  Created by Geraldo Bastos on 8/9/13.
//  Copyright (c) 2013 Geraldo Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestHTTPError : NSObject

+ (NSError*) createErrorWithStatusCode:(id)statusCode;

@end
