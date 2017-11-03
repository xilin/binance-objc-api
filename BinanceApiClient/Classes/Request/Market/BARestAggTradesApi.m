//
//  BARestAggTradesApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestAggTradesApi.h"

@interface BARestAggTradesApi ()

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger fromId;
@property(nonatomic, assign) NSInteger startTime;
@property(nonatomic, assign) NSInteger endTime;
@property(nonatomic, assign) NSInteger limit;

@end

@implementation BARestAggTradesApi

- (instancetype)initWithSymbol:(NSString *)symbol
                        fromId:(NSInteger)fromId
                     startTime:(NSInteger)startTime
                       endTime:(NSInteger)endTime
                         limit:(NSInteger)limit {
    if (self = [super init]) {
        _symbol = symbol;
        _fromId = fromId;
        _startTime = startTime;
        _endTime = endTime;
        _limit = limit;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/api/v1/aggTrades";
}

- (id)requestArgument {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"symbol"] = self.symbol;
    if (self.fromId > 0) {
        requestArgument[@"fromId"] = @(self.fromId);
    }
    if (self.limit > 0) {
        requestArgument[@"limit"] = @(self.limit);
    }
    if (self.startTime > 0) {
        requestArgument[@"startTime"] = @(self.startTime);
    }
    if (self.endTime > 0) {
        requestArgument[@"endTime"] = @(self.endTime);
    }
    return requestArgument;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSArray *array = [self parsedResponseData];
    self.aggTradeArray = [BAAggTradeModel arrayOfModelsFromDictionaries:array error:nil];
}

@end
