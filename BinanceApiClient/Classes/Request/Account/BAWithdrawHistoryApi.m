//
//  BAWithdrawHistoryApi.m
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BAWithdrawHistoryApi.h"

@interface BAWithdrawHistoryApi ()

@property(nonatomic, strong) BAAssetHistoryQueryParamModel *paramModel;

@end

@implementation BAWithdrawHistoryApi

- (instancetype)initWithParam:(BAAssetHistoryQueryParamModel *)paramModel {
    if (self = [super init]) {
        _paramModel = paramModel;
        _paramModel.timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/wapi/v1/getWithdrawHistory.html";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (NSDictionary *)requestArgumentWithoutSignature {
    return self.paramModel.requestArgument;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.withdrawArrayModel = [[BAWithdrawArrayModel alloc] initWithDictionary:dic error:nil];
}


@end
