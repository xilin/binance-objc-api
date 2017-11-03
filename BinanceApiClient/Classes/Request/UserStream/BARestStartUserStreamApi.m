//
//  BARestStartUserStreamApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestStartUserStreamApi.h"

@implementation BARestStartUserStreamApi

- (NSString *)requestUrl {
    return @"/api/v1/userDataStream";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.listenKey = dic[@"listenKey"];
}

@end

