//
//  RequestHTTPError.m
//  ErrorMessage
//
//  Created by Geraldo Bastos on 8/9/13.
//  Copyright (c) 2013 Geraldo Bastos. All rights reserved.
//

#import "RequestHTTPError.h"

#include "HTTPCode.h"

#define HTTP_CODE_NOT_FOUND 404
#define HTTP_CODE_BAD_REQUEST 400
#define HTTP_CODE_UNAUTHORIZED 401
#define HTTP_CODE_INTERNAL_ERROR 500
#define HTTP_CODE_NOT_IMPLEMENTED 501
#define HTTP_CODE_MOVED 301
#define HTTP_CODE_SUCCESS 200
#define HTTP_CODE_CREATED 201
#define HTTP_CODE_ACCEPTED 202
#define HTTP_CODE_NOT_CONTENT 204

#define DOMAIN_REQUEST_HTTP @"RequestHTTP"
#define localizedKey @"REQUEST_HTTP_"

@implementation RequestHTTPError


+ (NSError*) createErrorWithStatusCode:(id)statusCode
{
    
    int status = [statusCode intValue];
    NSString *message = [self getMessageError:status];
    NSError *error = [NSError errorWithDomain:DOMAIN_REQUEST_HTTP code:status userInfo:@{@"message":message} ];
    
    return error;
}


+(NSString*) getMessageError:(int)statusErro
{
    NSString *key = [localizedKey stringByAppendingFormat:@"%d",statusErro];
    NSString *message = NSLocalizedString(key, @"");
    
    if([message isEqualToString:[localizedKey stringByAppendingFormat:@"%d",statusErro]])
    {
        
        switch (statusErro) {
            case HTTP_CODE_NOT_FOUND:
                message = @"O serviço não foi encontrado.";
                break;
            case HTTP_CODE_BAD_REQUEST:
                message = @"Ocorreu um erro na solicitação do serviço.";
                break;
            case HTTP_CODE_UNAUTHORIZED:
                message = @"Acesso não autorizado.";
                break;
            case HTTP_CODE_INTERNAL_ERROR:
                message = @"Ocorreu um erro em nosso servidor. Tente novamente mais tarde.";
                break;
            case HTTP_CODE_NOT_IMPLEMENTED:
                message = @"O servidor não suporta essa funcionalidade.";
                break;
            case HTTP_CODE_MOVED:
                message = @"Ocorreu um redirecionamento do serviço.";
                break;
            case HTTP_CODE_CREATED:
                message = @"O serviço irá retornar uma nova resposta.";
                break;
            case HTTP_CODE_ACCEPTED:
                message = @"A requisição foi aceita e processada com sucesso.";
                break;
            case HTTP_CODE_NOT_CONTENT:
                message = @"Requisição feita com sucesso, mas sem retorno.";
                break;
            case HTTP_CODE_SUCCESS:
                message = @"Requisição realzada com sucesso.";
                break;
            default:
                break;
        }
        
    }
    
    return message;
}


@end
