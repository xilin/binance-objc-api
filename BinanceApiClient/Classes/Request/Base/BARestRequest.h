//
//  BARestRequest.h
//  BinanceApiClient
//
//  Created by LinXi on 01/11/2017.
//

#import <YTKNetwork/YTKNetwork.h>
#import "BACommonMacro.h"
#import "BAConstants.h"
#import "BAEnums.h"

@interface BARestRequest : YTKRequest

- (id)parsedResponseData;

@end
