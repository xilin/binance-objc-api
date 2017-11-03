//
//  BAOrderBookModel.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAOrderBookModel.h"
#import <BlocksKit/NSArray+BlocksKit.h>

@implementation BAOrderBookModel

+ (Class)classForCollectionProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"bids"] || [propertyName isEqualToString:@"asks"]) {
        return [BAOrderBookEntryModel class];
    }
    return nil;
}

- (void)setBidsWithJSONObject:(NSArray<NSArray<NSString *> *> *)bidArray {
    self.bids = [self entryArrayFromJSONArray:bidArray];
}

- (void)setAsksWithJSONObject:(NSArray<NSArray<NSString *> *> *)askArray {
    self.asks = [self entryArrayFromJSONArray:askArray];
}

- (NSArray<BAOrderBookEntryModel *> *)entryArrayFromJSONArray:(NSArray<NSArray<NSString *> *> *)array {
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
