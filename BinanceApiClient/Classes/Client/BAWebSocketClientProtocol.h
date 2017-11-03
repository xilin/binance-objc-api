//
//  BAWebSocketClientProtocol.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import <Foundation/Foundation.h>
#import "BAEnums.h"
#import "BAWebSocketEventModel.h"

typedef void (^BAWebSocketEventBlock)(__kindof BAWebSocketEventModel *eventModel);

@protocol BAWebSocketClientProtocol <NSObject>

- (void)onDepthEventWithSymbol:(NSString *)symbol listen:(BAWebSocketEventBlock)eventHandleBlock;

- (void)onKLineEventWithSymbol:(NSString *)symbol interval:(kKLineInterval)interval listen:(BAWebSocketEventBlock)eventHandleBlock;

- (void)onTradeEventWithSymbol:(NSString *)symbol listen:(BAWebSocketEventBlock)eventHandleBlock;

- (void)onUserDataEventWithListenKey:(NSString *)listenKey listen:(BAWebSocketEventBlock)eventHandleBlock;

- (void)close;

@end
