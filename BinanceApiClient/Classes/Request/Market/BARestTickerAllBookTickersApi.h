//
//  BARestTickerAllBookTickersApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestRequest.h"
#import "BABookTickerModel.h"

@interface BARestTickerAllBookTickersApi : BARestRequest

@property(nonatomic, strong) NSArray<BABookTickerModel *> *bookTickerArray;

@end
