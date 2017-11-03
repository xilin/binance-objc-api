//
//  BAAssetHistoryQueryParamModel.m
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BAAssetHistoryQueryParamModel.h"
#import "BACommonMacro.h"

@implementation BAAssetHistoryQueryParamModel

- (NSDictionary *)requestArgument {
    NSMutableDictionary *requestArgument = [NSMutableDictionary dictionary];
    if (STRING_HAS_VALUE(self.asset)) {
        requestArgument[@"asset"] = self.asset;
    }
    if (self.status > 0) {
        requestArgument[@"status"] = @(self.status);
    }
    if (self.startTime > 0) {
        requestArgument[@"startTime"] = @(self.startTime);
    }
    if (self.endTime > 0) {
        requestArgument[@"endTime"] = @(self.endTime);
    }
    if (self.recvWindow > 0) {
        requestArgument[@"recvWindow"] = @(self.recvWindow);
    }
    requestArgument[@"timestamp"] = @(self.timestamp);
    return requestArgument;
}

@end
