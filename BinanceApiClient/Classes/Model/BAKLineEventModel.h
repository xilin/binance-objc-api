//
//  BAKLineEventModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketEventModel.h"

@interface BAKLineEventBarDetailModel : BAJSONModel

@property(nonatomic, assign) NSInteger startTime;
@property(nonatomic, assign) NSInteger endTime;
@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, copy) NSString *interval;
@property(nonatomic, assign) NSInteger firstTradeId;
@property(nonatomic, assign) NSInteger lastTradeId;
@property(nonatomic, copy) NSString *open;
@property(nonatomic, copy) NSString *close;
@property(nonatomic, copy) NSString *high;
@property(nonatomic, copy) NSString *low;
@property(nonatomic, copy) NSString *volume;
@property(nonatomic, assign) NSInteger numberOfTrades;
@property(nonatomic, assign) BOOL isFinal;
@property(nonatomic, copy) NSString *quoteVolume;
@property(nonatomic, copy) NSString *volumeOfActiveBuy;
@property(nonatomic, copy) NSString *quoteVolumeOfActiveBuy;

@end

@interface BAKLineEventModel : BAWebSocketEventModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, strong) BAKLineEventBarDetailModel *barDetail;

@end
