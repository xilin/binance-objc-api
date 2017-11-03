//
//  BAAggTradeEventModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketEventModel.h"

@interface BAAggTradeEventModel : BAWebSocketEventModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger aggregatedTradeId;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *quantity;
@property(nonatomic, assign) NSInteger firstBreakdownTradeId;
@property(nonatomic, assign) NSInteger lastBreakdownTradeId;
@property(nonatomic, assign) NSInteger tradeTime;
@property(nonatomic, assign) BOOL isBuyerMaker;

@end
