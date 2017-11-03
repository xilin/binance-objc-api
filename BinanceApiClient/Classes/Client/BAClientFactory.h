//
//  BAClientFactory.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import <Foundation/Foundation.h>
#import "BARestClient.h"
#import "BAWebSocketClient.h"

@interface BAClientFactory : NSObject

- (instancetype)initWithApiKey:(NSString *)apiKey secret:(NSString *)secret;

- (BARestClient *)restClient;

- (BAWebSocketClient *)webSocketClient;

@end
