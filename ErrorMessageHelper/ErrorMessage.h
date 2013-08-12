//
//  ErrorMessage.h
//  ErrorMessage
//
//  Created by Geraldo Bastos on 8/8/13.
//  Copyright (c) 2013 Geraldo Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoogleMapsError.h"



enum TypeAPI {
    GoogleMaps,
    NativeGeoLocation,
    RequestHTTP
};

typedef enum TypeAPI TypeAPI;

@interface ErrorMessage : NSObject


+(NSError *) showMessageWithError:(id)error withTypeApi:(TypeAPI)api;

@end
