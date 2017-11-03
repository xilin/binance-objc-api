//
//  BARestPingApi.m
//  BinanceApiClient
//
//  Created by LinXi on 01/11/2017.
//

#import "BARestPingApi.h"

@implementation BARestPingApi

- (NSString *)requestUrl {
    return @"/api/v1/ping";
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.isSucceed = dic != nil;
}

@end
