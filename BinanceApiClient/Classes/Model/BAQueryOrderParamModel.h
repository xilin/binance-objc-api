//
//  BAQueryOrderParamModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

// Either orderId or origClientOrderId must be sent.
@interface BAQueryOrderParamModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger orderId;
@property(nonatomic, copy) NSString *origClientOrderId;
@property(nonatomic, copy) NSString *latestClientOrderId;
@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

@end
