//
//  BADeleteOrderResultModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BADeleteOrderResultModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, copy) NSString *origClientOrderId;
@property(nonatomic, assign) NSInteger orderId;
@property(nonatomic, copy) NSString *clientOrderId;

@end
