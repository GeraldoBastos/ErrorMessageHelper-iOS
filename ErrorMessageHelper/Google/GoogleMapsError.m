//
//  GoogleMapsError.m
//  ErrorMessage
//
//  Created by Geraldo Bastos on 8/8/13.
//  Copyright (c) 2013 Geraldo Bastos. All rights reserved.
//

#import "GoogleMapsError.h"
#include "HTTPCode.h"

#define NOT_FOUND @"NOT_FOUND"
#define ZERO_RESULTS @"ZERO_RESULTS"
#define MAX_WAYPOINTS_EXCEEDED @"MAX_WAYPOINTS_EXCEEDED"
#define INVALID_REQUEST @"INVALID_REQUEST"
#define OVER_QUERY_LIMIT @"OVER_QUERY_LIMIT"
#define REQUEST_DENIED @"REQUEST_DENIED"
#define UNKNOWN_ERROR @"UNKNOWN_ERROR"
#define localizedKey @"GOOGLE_MAPS_"


#define CODE_GOOGLE_MAPS_EXCEEDED_POINT 900
#define CODE_GOOGLE_OVER_QUERY_LIMIT 599

#define DOMAIN_GOOGLE_MAPS @"GoogleMaps"

/*****************
  
    Referência: https://developers.google.com/maps/documentation/directions/#StatusCodes
 
*****************/

@implementation GoogleMapsError

+ (NSError*) createErrorWithInfo:(id)info
{
    
    NSDictionary *jsonInfo = (NSDictionary*)info;
    NSString *message;
    NSString *statusErro = [self getStatusJSON:jsonInfo];
    int codeErro = 0;
    
    
    if([statusErro.lowercaseString isEqualToString:NOT_FOUND.lowercaseString])
    {
        message = [self getMessageError:NOT_FOUND];
        codeErro = HTTP_CODE_NOT_FOUND;
    }
    else if([statusErro.lowercaseString isEqualToString:ZERO_RESULTS.lowercaseString])
    {
        message = [self getMessageError:ZERO_RESULTS];
        codeErro = HTTP_CODE_NOT_CONTENT;
    }
    else if([statusErro.lowercaseString isEqualToString:MAX_WAYPOINTS_EXCEEDED.lowercaseString])
    {
        message = [self getMessageError:MAX_WAYPOINTS_EXCEEDED];
        codeErro = CODE_GOOGLE_MAPS_EXCEEDED_POINT;
    }
    else if([statusErro.lowercaseString isEqualToString:INVALID_REQUEST.lowercaseString])
    {
        message = [self getMessageError:INVALID_REQUEST];
        codeErro = HTTP_CODE_BAD_REQUEST;
    }
    else if([statusErro.lowercaseString isEqualToString:OVER_QUERY_LIMIT.lowercaseString])
    {
        message = [self getMessageError:OVER_QUERY_LIMIT];
        codeErro = CODE_GOOGLE_OVER_QUERY_LIMIT;
    }
    else if([statusErro.lowercaseString isEqualToString:REQUEST_DENIED.lowercaseString])
    {
        message = [self getMessageError:REQUEST_DENIED];
        codeErro = HTTP_CODE_UNAUTHORIZED;
    }
    else if([statusErro.lowercaseString isEqualToString:UNKNOWN_ERROR.lowercaseString])
    {
        message = [self getMessageError:UNKNOWN_ERROR];
        codeErro = HTTP_CODE_INTERNAL_ERROR;
    }
    else
    {
#if DEBUG
        NSLog(@"[GoogleMapsError] Não foi encontrado o status de erro: <%@>",statusErro);
#endif
        message = [self getMessageError:statusErro];
        codeErro = HTTP_CODE_INTERNAL_ERROR;
    }
    
    
    NSError *error = [NSError errorWithDomain:DOMAIN_GOOGLE_MAPS code:codeErro userInfo:@{@"message":message} ];
    
    
    return error;
    
}


+ (NSString*) getStatusJSON:(NSDictionary*)json
{
    NSString *status = @"";
    
    if([json objectForKey:@"status"])
    {
        status = [json objectForKey:@"status"];
    }
    
    return status;
}

+(NSString*) getMessageError:(NSString*)statusErro
{
    NSString *message = NSLocalizedString([localizedKey stringByAppendingString:statusErro], @"");
    
    if([message isEqualToString:[localizedKey stringByAppendingString:statusErro]])
    {
        
        if([statusErro isEqualToString:NOT_FOUND])
        {
            message = @"Não foi possível encontrar.";
        }
        else if([statusErro isEqualToString:ZERO_RESULTS])
        {
            message = @"Não foi encontrado nenhum endereço.";
        }
        else if([statusErro isEqualToString:MAX_WAYPOINTS_EXCEEDED])
        {
            message = @"Excedeu a quantidade limte de pontos.";
        }
        else if([statusErro isEqualToString:INVALID_REQUEST])
        {
            message = @"Ocorreu um problema no serviço. Tente novamente mais tarde.";
        }
        else if([statusErro isEqualToString:OVER_QUERY_LIMIT])
        {
            message = @"Ocorreu uma sobrecarga no serviço. Tente novamente mais tarde.";
        }
        else if([statusErro isEqualToString:REQUEST_DENIED])
        {
            message = @"Não foi possível executar o serviço. Tente novamente mais tarde.";
        }
        else if([statusErro isEqualToString:UNKNOWN_ERROR])
        {
            message = @"Ocorreu um problema no serviço. Tente novamente mais tarde.";
        }
        else
        {
            message = @"Não foi possível executar o serviço. Tente novamente mais tarde.";
        }
        
    }
    
    return message;
}

@end
