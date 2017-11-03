//
//  BACreateOrderModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BACreateOrderModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) kOrderSide side;
@property(nonatomic, assign) kOrderType type;
@property(nonatomic, assign) kTimeInForce timeInForce;
@property(nonatomic, copy) NSString *quantity;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString<Optional> *latestClientOrderId;
@property(nonatomic, copy) NSString<Optional> *stopPrice;
@property(nonatomic, copy) NSString<Optional> *icebergQty;
@property(nonatomic, assign) NSInteger timestamp;
@property(nonatomic, assign) NSInteger recvWindow;

@end
