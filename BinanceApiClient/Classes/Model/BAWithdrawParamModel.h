//
//  BAWithdrawParamModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BAWithdrawParamModel : BAJSONModel

@property(nonatomic, copy) NSString *asset;
@property(nonatomic, copy) NSString *address;
@property(nonatomic, copy) NSString *amount;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

@end
