//
//  BAKLineModel.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAKLineModel.h"

@implementation BAKLineModel

+ (NSDictionary *)kLineIntervalEnumStringDictionary {
    return @{
        @(kKLineIntervalOneMinute) : @"1m",
        @(kKLineIntervalThreeMinutes) : @"3m",
        @(kKLineIntervalFiveMinutes) : @"5m",
        @(kKLineIntervalFifteenMinutes) : @"15m",
        @(kKLineIntervalHalfHour) : @"30m",
        @(kKLineIntervalOneHour) : @"1h",
        @(kKLineIntervalTwoHours) : @"2h",
        @(kKLineIntervalFourHours) : @"4h",
        @(kKLineIntervalSixHours) : @"6h",
        @(kKLineIntervalEightHours) : @"8h",
        @(kKLineIntervalTwelveHours) : @"12h",
        @(kKLineIntervalOneDay) : @"1d",
        @(kKLineIntervalThreeDays) : @"3d",
        @(kKLineIntervalOneWeek) : @"1w",
        @(kKLineIntervalOneMonth) : @"1M"
    };
}

@end
