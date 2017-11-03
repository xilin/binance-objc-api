//
//  BAAccountUpdateEventModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketEventModel.h"

@interface BAAssetBalanceModel : BAJSONModel

@property(nonatomic, copy) NSString *asset;
@property(nonatomic, copy) NSString *availableBalance;
@property(nonatomic, copy) NSString *lockedByOpenOrders;

@end

@interface BAAccountUpdateEventModel : BAWebSocketEventModel

@property(nonatomic, strong) NSArray<BAAssetBalanceModel *> *balanceArray;

@end
