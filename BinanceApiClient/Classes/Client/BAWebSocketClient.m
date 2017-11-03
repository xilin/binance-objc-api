//
//  BAWebSocketClient.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketClient.h"
#import <SocketRocket/SRWebSocket.h>
#import "BAConstants.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "BAKLineModel.h"
#import <YYCategories/NSString+YYAdd.h>

typedef void (^MessageListenBlock)(NSString *message);

@interface BAWebSocketClient () <SRWebSocketDelegate>

@property(nonatomic, strong) SRWebSocket *socketClient;
@property(nonatomic, copy) MessageListenBlock listenBlock;

@end

@implementation BAWebSocketClient

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - private methods
- (void)socketClientWithChannel:(NSString *)channel listenBlock:(MessageListenBlock)listenBlock {
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", BA_WEBSOCKET_API_BASE_URL, channel]]];
    SRWebSocket *socketClient = [[SRWebSocket alloc] initWithURLRequest:urlRequest];
    socketClient.delegate = self;
    self.socketClient = socketClient;
    self.listenBlock = listenBlock;
    [self.socketClient open];
}

#pragma mark - BAWebSocketClientProtocol
- (void)onDepthEventWithSymbol:(NSString *)symbol listen:(BAWebSocketEventBlock)eventHandleBlock {
    NSString *channel = [NSString stringWithFormat:@"%@@depth", [symbol lowercaseString]];
    [self socketClientWithChannel:channel
                      listenBlock:^void(NSString *message) {
                        BADepthEventModel *eventModel = [[BADepthEventModel alloc] initWithString:message error:nil];
                        eventHandleBlock(eventModel);
                      }];
}

- (void)onKLineEventWithSymbol:(NSString *)symbol interval:(kKLineInterval)interval listen:(BAWebSocketEventBlock)eventHandleBlock {
    NSString *intervalString = [BAKLineModel kLineIntervalEnumStringDictionary][@(interval)];
    NSString *channel = [NSString stringWithFormat:@"%@@kline_%@", [symbol lowercaseString], intervalString];
    [self socketClientWithChannel:channel
                      listenBlock:^(NSString *message) {
                        BAKLineEventModel *eventModel = [[BAKLineEventModel alloc] initWithString:message error:nil];
                        eventHandleBlock(eventModel);
                      }];
}

- (void)onTradeEventWithSymbol:(NSString *)symbol listen:(BAWebSocketEventBlock)eventHandleBlock {
    NSString *channel = [NSString stringWithFormat:@"%@@aggTrade", [symbol lowercaseString]];
    [self socketClientWithChannel:channel
                      listenBlock:^(NSString *message) {
                        BAAggTradeEventModel *eventModel = [[BAAggTradeEventModel alloc] initWithString:message error:nil];
                        eventHandleBlock(eventModel);
                      }];
}

- (void)onUserDataEventWithListenKey:(NSString *)listenKey listen:(BAWebSocketEventBlock)eventHandleBlock {
    NSString *channel = [NSString stringWithFormat:@"%@", listenKey];
    [self socketClientWithChannel:channel
                      listenBlock:^(NSString *message) {
                        NSDictionary *dictionary = [message jsonValueDecoded];
                        NSString *eventType = dictionary[@"e"];
                        BAWebSocketEventModel *eventModel = nil;
                        if ([eventType isEqualToString:@"outboundAccountInfo"]) {
                            eventModel = [[BAAccountUpdateEventModel alloc] initWithDictionary:dictionary error:nil];
                        } else if ([eventType isEqualToString:@"executionReport"]) {
                            eventModel = [[BAOrderTradeUpdateEventModel alloc] initWithDictionary:dictionary error:nil];
                        }
                        eventHandleBlock(eventModel);
                      }];
}

- (void)close {
    [self.socketClient close];
}

#pragma mark - web socket delegate
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    if (self.listenBlock) {
        if ([message isKindOfClass:[NSString class]]) {
            self.listenBlock(message);
        } else {
            DDLogWarn(@"Receive unknown message: %@", message);
        }
    }
}

@end
