//
//  BARestWithdrawApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestWithdrawApi.h"
#import "BACommonMacro.h"

@interface BARestWithdrawApi ()

@property(nonatomic, strong) BAWithdrawParamModel *paramModel;

@end

@implementation BARestWithdrawApi

- (instancetype)initWithParam:(BAWithdrawParamModel *)paramModel {
    if (self = [super init]) {
        _paramModel = paramModel;
        _paramModel.timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/wapi/v1/withdraw.html";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (NSDictionary *)requestArgumentWithoutSignature {
    BAWithdrawParamModel *model = self.paramModel;
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"asset"] = model.asset;
    requestArgument[@"address"] = model.address;
    requestArgument[@"amount"] = model.amount;
    if (STRING_HAS_VALUE(model.name)) {
        requestArgument[@"name"] = model.name;
    }
    if (model.recvWindow > 0) {
        requestArgument[@"recvWindow"] = @(model.recvWindow);
    }
    requestArgument[@"timestamp"] = @(model.timestamp);
    return requestArgument;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.resultModel = [[BAWithdrawResultModel alloc] initWithDictionary:dic error:nil];
}

@end
