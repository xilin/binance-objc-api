//
//  BARestAllOrdersApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestAllOrdersApi.h"

@interface BARestAllOrdersApi ()

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger orderId;
@property(nonatomic, assign) NSInteger limit;
@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

@end

@implementation BARestAllOrdersApi

- (instancetype)initWithSymbol:(NSString *)symbol
                       orderId:(NSInteger)orderId
                         limit:(NSInteger)limit
                    recvWindow:(NSInteger)recvWindow {
    if (self = [super init]) {
        _symbol = symbol;
        _orderId = orderId;
        _limit = limit;
        _recvWindow = recvWindow;
        _timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/api/v3/allOrders";
}

- (NSDictionary *)requestArgumentWithoutSignature {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"symbol"] = self.symbol;
    if (self.orderId > 0) {
        requestArgument[@"orderId"] = @(self.orderId);
    }
    if (self.limit > 0) {
        requestArgument[@"limit"] = @(self.limit);
    }
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
