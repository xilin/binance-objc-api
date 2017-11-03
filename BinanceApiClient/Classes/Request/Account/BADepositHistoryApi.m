//
//  BADepositHistoryApi.m
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BADepositHistoryApi.h"

@interface BADepositHistoryApi ()

@property(nonatomic, strong) BAAssetHistoryQueryParamModel *paramModel;

@end

@implementation BADepositHistoryApi

- (instancetype)initWithParam:(BAAssetHistoryQueryParamModel *)paramModel {
    if (self = [super init]) {
        _paramModel = paramModel;
        _paramModel.timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/wapi/v1/getDepositHistory.html";
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
    self.depositArrayModel = [[BADepositArrayModel alloc] initWithDictionary:dic error:nil];
}

@end
