//
//  BADepthEventModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BADepthEventModel.h"
#import <BlocksKit/NSArray+BlocksKit.h>

@implementation BADepthEventModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"eventType" : @"e",
                                                                  @"eventTime" : @"E",
                                                                  @"symbol" : @"s",
                                                                  @"updateId" : @"u",
                                                                  @"bidDepthDeltaArray" : @"b",
                                                                  @"askDepthDeltaArray" : @"a"
                                                                  }];
}

+ (Class)classForCollectionProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"b"] || [propertyName isEqualToString:@"a"]) {
        return [BAOrderBookEntryModel class];
    }
    return nil;
}

- (void)setBidDepthDeltaArrayWithJSONObject:(NSArray<NSArray<NSString *> *> *)bidArray {
    self.bidDepthDeltaArray = [self depthArrayFromJSONArray:bidArray];
}

- (void)setAskDepthDeltaArrayWithJSONObject:(NSArray<NSArray<NSString *> *> *)askArray {
    self.askDepthDeltaArray = [self depthArrayFromJSONArray:askArray];
}

- (NSArray<BAOrderBookEntryModel *> *)depthArrayFromJSONArray:(NSArray<NSArray<NSString *> *> *)array {
    return [array bk_map:^id(NSArray<NSString *> * obj) {
        BAOrderBookEntryModel *entryModel = [BAOrderBookEntryModel new];
        if (obj.count == 3) {
            entryModel.price = obj[0];
            entryModel.qty = obj[1];
        }
        return entryModel;
    }];
}

@end
