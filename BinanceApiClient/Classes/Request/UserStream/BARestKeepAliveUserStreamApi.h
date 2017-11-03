//
//  BARestKeepAliveUserStreamApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAApiKeyRestRequest.h"

@interface BARestKeepAliveUserStreamApi : BAApiKeyRestRequest

- (instancetype)initWithListenKey:(NSString *)listenKey;

@end
