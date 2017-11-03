//
//  BACreateOrderResultModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BACreateOrderResultModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger orderId;
@property(nonatomic, copy) NSString *clientOrderId;
@property(nonatomic, assign) NSInteger transactTime;

@end
