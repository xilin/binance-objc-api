//
//  BAClientFactory.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAClientFactory.h"

@interface BAClientFactory()

@property(nonatomic, copy) NSString *apiKey;
@property(nonatomic, copy) NSString *secret;

@end

@implementation BAClientFactory

- (instancetype)initWithApiKey:(NSString *)apiKey secret:(NSString *)secret {
    if (self = [super init]) {
        _apiKey = apiKey;
        _secret = secret;
    }
    return self;
}

- (BARestClient *)restClient {
    return [[BARestClient alloc] initWithApiKey:self.apiKey secret:self.secret];
}

- (BAWebSocketClient *)webSocketClient {
    return [[BAWebSocketClient alloc] init];
}

@end
