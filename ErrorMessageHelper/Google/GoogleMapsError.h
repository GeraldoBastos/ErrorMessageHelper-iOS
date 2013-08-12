//
//  GoogleMapsError.h
//  ErrorMessage
//
//  Created by Geraldo Bastos on 8/8/13.
//  Copyright (c) 2013 Geraldo Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoogleMapsError : NSObject


+ (NSError*) createErrorWithInfo:(id)info;

@end
