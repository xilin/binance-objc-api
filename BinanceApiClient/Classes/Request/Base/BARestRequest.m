//
//  BARestRequest.m
//  BinanceApiClient
//
//  Created by LinXi on 01/11/2017.
//

#import "BARestRequest.h"
#import <YYCategories/NSString+YYAdd.h>

@implementation BARestRequest

- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeHTTP;
}

- (id)parsedResponseData {
    id responseData = [self responseJSONObject];
    if (!responseData) {
        if (STRING_HAS_VALUE(self.responseString)) {
            responseData = [self.responseString jsonValueDecoded];
        }
    }
    return responseData;
}

@end
