//
//  BADepositArrayModel.h
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BAWAPIResultModel.h"

@interface BADepositRecordModel : BAJSONModel

@property(nonatomic, assign) NSInteger insertTime;
@property(nonatomic, assign) NSInteger amount;
@property(nonatomic, copy) NSString *asset;
@property(nonatomic, assign) NSInteger status;

@end

@interface BADepositArrayModel : BAWAPIResultModel

@property(nonatomic, strong) NSArray<BADepositRecordModel *> *depositList;

@end
