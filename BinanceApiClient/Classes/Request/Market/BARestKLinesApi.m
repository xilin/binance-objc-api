//
//  BARestKLinesApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestKLinesApi.h"
#import <BlocksKit/NSArray+BlocksKit.h>

@interface BARestKLinesApi ()

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) kKLineInterval interval;
@property(nonatomic, assign) NSInteger startTime;
@property(nonatomic, assign) NSInteger endTime;
@property(nonatomic, assign) NSInteger limit;

@property(nonatomic, strong) NSDictionary *kLineIntervalEnumStringDictionary;

@end

@implementation BARestKLinesApi

- (instancetype)initWithSymbol:(NSString *)symbol
                        kKLineInterval:(kKLineInterval)interval
                     startTime:(NSInteger)startTime
                       endTime:(NSInteger)endTime
                         limit:(NSInteger)limit {
    if (self = [super init]) {
        _symbol = symbol;
        _interval = interval;
        _startTime = startTime;
        _endTime = endTime;
        _limit = limit;
        
        _kLineIntervalEnumStringDictionary = [BAKLineModel kLineIntervalEnumStringDictionary];
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/api/v1/klines";
}

- (id)requestArgument {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"symbol"] = self.symbol;
    requestArgument[@"interval"] = self.kLineIntervalEnumStringDictionary[@(self.interval)];
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
    if (ARRAY_HAS_VALUE(array)) {
        self.kLineArray = [array bk_map:^id(NSArray<NSString *> *obj) {
            BAKLineModel *model = [BAKLineModel new];
            model.openTime = [obj[0] longLongValue];
            model.open = obj[1];
            model.high = obj[2];
            model.low = obj[3];
            model.close = obj[4];
            model.volume = obj[5];
            model.closeTime = [obj[6] longLongValue];
            model.quoteAssetVolume = obj[7];
            model.numberOfTrades = [obj[8] longLongValue];
            model.takerBuyBaseAssetVolume = obj[9];
            model.takerBuyQuoteAssetVolume = obj[10];
            return model;
        }];
    }
}

@end
