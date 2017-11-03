//
//  BARestServerTimeApi.m
//  BinanceApiClient
//
//  Created by LinXi on 01/11/2017.
//

#import "BARestServerTimeApi.h"

@implementation BARestServerTimeApi

- (NSString *)requestUrl {
    return @"/api/v1/time";
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.serverTime = [dic[@"serverTime"] longLongValue];
}

@end
