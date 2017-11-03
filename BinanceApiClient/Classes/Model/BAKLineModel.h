//
//  BAKLineModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"

@interface BAKLineModel : BAJSONModel

@property (nonatomic, assign) NSInteger openTime;
@property (nonatomic, copy) NSString *open;
@property (nonatomic, copy) NSString *high;
@property (nonatomic, copy) NSString *low;
@property (nonatomic, copy) NSString *close;
@property (nonatomic, copy) NSString *volume;
@property (nonatomic, assign) NSInteger closeTime;
@property (nonatomic, copy) NSString *quoteAssetVolume;
@property (nonatomic, assign) NSInteger numberOfTrades;
@property (nonatomic, copy) NSString *takerBuyBaseAssetVolume;
@property (nonatomic, copy) NSString *takerBuyQuoteAssetVolume;

+ (NSDictionary *)kLineIntervalEnumStringDictionary;

@end
