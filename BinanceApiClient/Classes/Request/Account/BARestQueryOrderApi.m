//
//  BARestQueryOrderApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestQueryOrderApi.h"

@interface BARestQueryOrderApi ()

@property(nonatomic, strong) BAQueryOrderParamModel *paramModel;

@end

@implementation BARestQueryOrderApi

- (instancetype)initWithParam:(BAQueryOrderParamModel *)paramModel {
    if (self = [super init]) {
        _paramModel = paramModel;
        _paramModel.timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return self;
}

- (NSString *)requestUrlWithoutSignature {
    return @"/api/v3/order";
}

- (NSDictionary *)requestArgumentWithoutSignature {
    BAQueryOrderParamModel *model = self.paramModel;
    
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    requestArgument[@"symbol"] = model.symbol;
    if (model.orderId > 0) {
        requestArgument[@"orderId"] = @(model.orderId);
    }
    if (STRING_HAS_VALUE(model.origClientOrderId)) {
        requestArgument[@"origClientOrderId"] = model.origClientOrderId;
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
    self.orderModel = [[BAOrderModel alloc] initWithDictionary:dic error:nil];
}

@end
