//
//  BARestTickerAllBookTickersApi.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestTickerAllBookTickersApi.h"

@implementation BARestTickerAllBookTickersApi

- (NSString *)requestUrl {
    return @"/api/v1/ticker/allBookTickers";
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSArray *array = [self parsedResponseData];
    self.bookTickerArray = [BABookTickerModel arrayOfModelsFromDictionaries:array error:nil];
}

@end
