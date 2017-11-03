//
//  BAOrderModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"

@interface BAOrderModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, copy) NSString *orderId;
@property(nonatomic, copy) NSString *clientOrderId;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *origQty;
@property(nonatomic, copy) NSString *executedQty;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSString *timeInForce;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *side;
@property(nonatomic, copy) NSString *stopPrice;
@property(nonatomic, copy) NSString *icebergQty;
@property(nonatomic, assign) NSInteger time;

@end
