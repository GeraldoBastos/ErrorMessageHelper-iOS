# ErrorMessage
___
ErrorMessage pode ser usado para facilitar o tratamento de erros com as APIs públicas como o GoogleMaps e requisições HTTP.


## Features
___

* GoogleMapsError
	+ Tratamento de erro para o serviço de direções - [GoogleMaps](goo.gl/gfE8T9).
* RequestHTTPError
	+ Tratamento de erro para os retornos de uma requisição HTTP. Todos os tratamentos foram baseados na documentação da [w3](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html).
	
## Exemplo
 
```objective-c
NSDictionary *dic = @{@"status":@"ZERO_RESULTS",@"routes":@[]};
    NSError *error = [ErrorMessage showMessageWithError:dic withTypeApi:GoogleMaps];
    NSLog(@"%@",error.description);
```

## Licença
___
O código e sua distribuição encontra-se sobre os termos e condições do [Apache v2 License](LICENSE).

