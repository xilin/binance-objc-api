//
//  BARestCloseUserStreamApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestCloseUserStreamApi.h"

@interface BARestCloseUserStreamApi ()

@property(nonatomic, copy) NSString *listenKey;

@end

@implementation BARestCloseUserStreamApi

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
    return YTKRequestMethodDELETE;
}

@end
