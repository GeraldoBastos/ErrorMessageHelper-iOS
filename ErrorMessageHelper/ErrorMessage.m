//
//  ErrorMessage.m
//  ErrorMessage
//
//  Created by Geraldo Bastos on 8/8/13.
//  Copyright (c) 2013 Geraldo Bastos. All rights reserved.
//

#import "ErrorMessage.h"
#import "RequestHTTPError.h"


@implementation ErrorMessage

+(NSError *) showMessageWithError:(id)error
                 withTypeApi:(TypeAPI)api
{
    NSError *errorAPi = nil;
    
    switch (api) {
        case GoogleMaps:
            errorAPi = [GoogleMapsError createErrorWithInfo:error];
            break;
        case RequestHTTP:
            errorAPi = [RequestHTTPError createErrorWithStatusCode:error];
            break;
        default:
            break;
    }
    
    return errorAPi;
}

@end
