//
//  BARestAccountInfoApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAAccountInfoModel.h"

@interface BARestAccountInfoApi : BASignedRestRequest

@property(nonatomic, strong) BAAccountInfoModel *accountInfoModel;

- (instancetype)initWithRecvWindow:(NSInteger)recvWindow;

@end
