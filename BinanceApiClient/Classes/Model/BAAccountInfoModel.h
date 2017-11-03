//
//  BAAccountInfoModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BAAccountBalanceModel : BAJSONModel

@property(nonatomic, copy) NSString *asset;
@property(nonatomic, copy) NSString *free;
@property(nonatomic, copy) NSString *locked;

@end

@interface BAAccountInfoModel : BAJSONModel

@property(nonatomic, assign) NSInteger makerCommission;
@property(nonatomic, assign) NSInteger takerCommission;
@property(nonatomic, assign) NSInteger buyerCommission;
@property(nonatomic, assign) NSInteger sellerCommission;
@property(nonatomic, assign) BOOL canTrade;
@property(nonatomic, assign) BOOL canWithdraw;
@property(nonatomic, assign) BOOL canDeposit;
@property(nonatomic, strong) NSArray<BAAccountBalanceModel *> *balances;

@end
