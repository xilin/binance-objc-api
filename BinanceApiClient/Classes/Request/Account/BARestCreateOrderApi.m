//
//  BARestCreateOrderApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestCreateOrderApi.h"

@interface BARestCreateOrderApi ()

@end

@implementation BARestCreateOrderApi

- (NSString *)requestUrlWithoutSignature {
    return @"/api/v3/order";
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.createOrderResultModel = [[BACreateOrderResultModel alloc] initWithDictionary:dic error:nil];
}

@end
