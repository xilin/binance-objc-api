//
//  BAWithdrawArrayModel.h
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BAWAPIResultModel.h"

@interface BAWithdrawRecordModel : BAJSONModel

@property(nonatomic, assign) NSInteger applyTime;
@property(nonatomic, assign) NSInteger amount;
@property(nonatomic, copy) NSString *asset;
@property(nonatomic, assign) NSInteger status;
@property(nonatomic, copy) NSString *address;
@property(nonatomic, copy) NSString<Optional> *txId;

@end

@interface BAWithdrawArrayModel : BAWAPIResultModel

@property(nonatomic, strong) NSArray<BAWithdrawRecordModel *> *withdrawList;

@end
