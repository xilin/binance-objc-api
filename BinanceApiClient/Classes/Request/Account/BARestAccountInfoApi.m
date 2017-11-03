//
//  BARestAccountInfoApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestAccountInfoApi.h"

@interface BARestAccountInfoApi ()

@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

@end

@implementation BARestAccountInfoApi

- (instancetype)initWithRecvWindow:(NSInteger)recvWindow {
    if (self = [super init]) {
        _recvWindow = recvWindow;
        _timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/api/v3/account";
}

- (NSDictionary *)requestArgumentWithoutSignature {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    if (self.recvWindow > 0) {
        requestArgument[@"recvWindow"] = @(self.recvWindow);
    }
    requestArgument[@"timestamp"] = @(self.timestamp);
    return requestArgument;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.accountInfoModel = [[BAAccountInfoModel alloc] initWithDictionary:dic error:nil];
}

@end
