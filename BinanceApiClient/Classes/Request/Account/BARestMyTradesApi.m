//
//  BARestMyTradesApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestMyTradesApi.h"

@interface BARestMyTradesApi ()

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger fromId;
@property(nonatomic, assign) NSInteger limit;
@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

@end

@implementation BARestMyTradesApi

- (instancetype)initWithSymbol:(NSString *)symbol
                       fromId:(NSInteger)fromId
                         limit:(NSInteger)limit
                    recvWindow:(NSInteger)recvWindow {
    if (self = [super init]) {
        _symbol = symbol;
        _fromId = fromId;
        _limit = limit;
        _recvWindow = recvWindow;
        _timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/api/v3/myTrades";
}

- (NSDictionary *)requestArgumentWithoutSignature {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"symbol"] = self.symbol;
    if (self.fromId > 0) {
        requestArgument[@"fromId"] = @(self.fromId);
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
    self.tradeArray = [BATradeModel arrayOfModelsFromDictionaries:array error:nil];
}

@end
