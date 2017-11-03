//
//  BARestKeepAliveUserStreamApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestKeepAliveUserStreamApi.h"

@interface BARestKeepAliveUserStreamApi ()

@property(nonatomic, copy) NSString *listenKey;

@end

@implementation BARestKeepAliveUserStreamApi

- (instancetype)initWithListenKey:(NSString *)listenKey {
    if (self = [super init]) {
        _listenKey = listenKey;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/api/v1/userDataStream";
}

- (id)requestArgument {
    return @{@"listenKey" : self.listenKey};
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPUT;
}

@end
