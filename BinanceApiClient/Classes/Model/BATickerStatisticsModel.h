//
//  BATickerStatisticsModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"

@interface BATickerStatisticsModel : BAJSONModel

@property(nonatomic, copy) NSString *askPrice;
@property(nonatomic, copy) NSString *askQty;
@property(nonatomic, copy) NSString *bidPrice;
@property(nonatomic, copy) NSString *bidQty;
@property(nonatomic, copy) NSString *highPrice;
@property(nonatomic, copy) NSString *lastPrice;
@property(nonatomic, copy) NSString *lastQty;
@property(nonatomic, copy) NSString *lowPrice;
@property(nonatomic, copy) NSString *openPrice;
@property(nonatomic, copy) NSString *prevClosePrice;
@property(nonatomic, copy) NSString *priceChange;
@property(nonatomic, copy) NSString *priceChangePercent;
@property(nonatomic, copy) NSString *quoteVolume;
@property(nonatomic, copy) NSString *volume;
@property(nonatomic, copy) NSString *weightedAvgPrice;
@property(nonatomic, assign) NSInteger openTime;
@property(nonatomic, assign) NSInteger closeTime;
@property(nonatomic, assign) NSInteger firstId;
@property(nonatomic, assign) NSInteger lastId;
@property(nonatomic, assign) NSInteger count;

@end
