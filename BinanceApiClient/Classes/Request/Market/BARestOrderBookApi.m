//
//  BARestOrderBookApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestOrderBookApi.h"

@interface BARestOrderBookApi ()

@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, assign) NSInteger limit;

@end

@implementation BARestOrderBookApi

- (instancetype)initWithSymbol:(NSString *)symbol limit:(NSInteger)limit {
    if (self = [super init]) {
        _symbol = symbol;
        _limit = limit;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/api/v1/depth";
}

- (id)requestArgument {
    return @{ @"symbol" : self.symbol,
              @"limit" : @(self.limit)
    };
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.orderBookModel = [[BAOrderBookModel alloc] initWithDictionary:dic error:nil];
}

@end
