//
//  BARestTicker24HourApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestRequest.h"
#import "BATickerStatisticsModel.h"

@interface BARestTicker24HourApi : BARestRequest

@property(nonatomic, strong) BATickerStatisticsModel *statisticsModel;

- (instancetype)initWithSymbol:(NSString *)symbol;

@end
