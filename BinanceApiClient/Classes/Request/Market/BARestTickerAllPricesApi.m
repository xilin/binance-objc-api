//
//  BARestTickerAllPricesApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestTickerAllPricesApi.h"

@implementation BARestTickerAllPricesApi

- (NSString *)requestUrl {
    return @"/api/v1/ticker/allPrices";
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSArray *array = [self parsedResponseData];
    self.tickerPriceArray = [BATickerPriceModel arrayOfModelsFromDictionaries:array error:nil];
}

@end
