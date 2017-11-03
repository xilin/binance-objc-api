//
//  BAOrderTradeUpdateEventModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketEventModel.h"

@interface BAOrderTradeUpdateEventModel : BAWebSocketEventModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, copy) NSString *latestClientOrderId;
@property(nonatomic, copy) NSString *side;
@property(nonatomic, copy) NSString *orderType;
@property(nonatomic, copy) NSString *timeInForce;
@property(nonatomic, copy) NSString *originalQuantity;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *executionType;
@property(nonatomic, copy) NSString *orderGotFilled;
@property(nonatomic, assign) NSInteger orderId;
@property(nonatomic, copy) NSString *quantityOfLastFilledTrade;
@property(nonatomic, copy) NSString *accumulatedQuantity;
@property(nonatomic, copy) NSString *priceOfLastFilledTrade;
@property(nonatomic, copy) NSString *commission;
@property(nonatomic, copy) NSString *asset;
@property(nonatomic, assign) NSInteger tradeTime;
@property(nonatomic, assign) NSInteger tradeId;
@property(nonatomic, assign) BOOL isBuyerMaker;

@end
