//
//  BAAggTradeModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"

@interface BAAggTradeModel : BAJSONModel

@property(nonatomic, assign) NSInteger tradeId;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *quantity;
@property(nonatomic, assign) NSInteger firstTradeId;
@property(nonatomic, assign) NSInteger lastTradeId;
@property(nonatomic, assign) NSInteger timestamp;
@property(nonatomic, assign) BOOL isBuyerMaker;
@property(nonatomic, assign) BOOL isBestPriceMatched;

@end
