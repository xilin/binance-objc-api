//
//  BARestCloseUserStreamApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAApiKeyRestRequest.h"

@interface BARestCloseUserStreamApi : BAApiKeyRestRequest

- (instancetype)initWithListenKey:(NSString *)listenKey;

@end
