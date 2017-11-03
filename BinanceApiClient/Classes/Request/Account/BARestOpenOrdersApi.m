//
//  BARestOpenOrdersApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestOpenOrdersApi.h"

@interface BARestOpenOrdersApi ()

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

@end

@implementation BARestOpenOrdersApi

- (instancetype)initWithSymbol:(NSString *)symbol
                    recvWindow:(NSInteger)recvWindow {
    if (self = [super init]) {
        _symbol = symbol;
        _recvWindow = recvWindow;
        _timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/api/v3/openOrders";
}

- (NSDictionary *)requestArgumentWithoutSignature {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"symbol"] = self.symbol;
    if (self.recvWindow > 0) {
        requestArgument[@"recvWindow"] = @(self.recvWindow);
    }
    requestArgument[@"timestamp"] = @(self.timestamp);
    return requestArgument;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSArray *array = [self parsedResponseData];
    self.orderArray = [BAOrderModel arrayOfModelsFromDictionaries:array error:nil];
}

@end
