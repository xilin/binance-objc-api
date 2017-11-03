//
//  BATradeModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BATradeModel : BAJSONModel

@property(nonatomic, assign) NSInteger tradeId;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *qty;
@property(nonatomic, copy) NSString *commission;
@property(nonatomic, copy) NSString *commissionAsset;
@property(nonatomic, assign) NSInteger time;
@property(nonatomic, assign) BOOL isBuyer;
@property(nonatomic, assign) BOOL isMaker;
@property(nonatomic, assign) BOOL isBestMatch;

@end
