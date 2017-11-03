//
//  BARestTickerAllPricesApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestRequest.h"
#import "BATickerPriceModel.h"

@interface BARestTickerAllPricesApi : BARestRequest

@property(nonatomic, strong) NSArray<BATickerPriceModel *> *tickerPriceArray;

@end
