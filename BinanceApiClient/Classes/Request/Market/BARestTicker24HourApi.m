//
//  BARestTicker24HourApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestTicker24HourApi.h"

@interface BARestTicker24HourApi ()

@property(nonatomic, copy) NSString *symbol;

@end

@implementation BARestTicker24HourApi

- (instancetype)initWithSymbol:(NSString *)symbol {
    if (self = [super init]) {
        _symbol = symbol;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/api/v1/ticker/24hr";
}

- (id)requestArgument {
    return @{ @"symbol" : self.symbol };
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.statisticsModel = [[BATickerStatisticsModel alloc] initWithDictionary:dic error:nil];
}

@end
