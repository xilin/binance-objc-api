//
//  BARestDeleteOrderApi.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestDeleteOrderApi.h"

@interface BARestQueryOrderApi ()

@property(nonatomic, strong) BAQueryOrderParamModel *paramModel;

@end

@interface BARestDeleteOrderApi ()

@end

@implementation BARestDeleteOrderApi

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodDELETE;
}

- (NSDictionary *)requestArgumentWithoutSignature {
    BAQueryOrderParamModel *model = self.paramModel;
    
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionaryWithDictionary:[super requestArgumentWithoutSignature]];
    if (STRING_HAS_VALUE(model.latestClientOrderId)) {
        requestArgument[@"newClientOrderId"] = model.latestClientOrderId;
    }
    return requestArgument;
}

- (void)requestCompleteFilter {
    [super requestCompleteFilter];
    NSDictionary *dic = [self parsedResponseData];
    self.resultModel = [[BADeleteOrderResultModel alloc] initWithDictionary:dic error:nil];
}

@end
