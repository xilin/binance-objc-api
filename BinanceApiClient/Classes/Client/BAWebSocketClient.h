//
//  BAWebSocketClient.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import <Foundation/Foundation.h>
#import "BAWebSocketClientProtocol.h"
#import "BACommonMacro.h"
#import "BADepthEventModel.h"
#import "BAKLineEventModel.h"
#import "BAAggTradeEventModel.h"
#import "BAAccountUpdateEventModel.h"
#import "BAOrderTradeUpdateEventModel.h"
#import "BAOrderTradeUpdateEventModel.h"

@interface BAWebSocketClient : NSObject <BAWebSocketClientProtocol>

@end
