//
//  BACommonMacro.h
//  Pods
//
//  Created by LinXi on 01/11/2017.
//

#ifndef BACommonMacro_h
#define BACommonMacro_h

#import <CocoaLumberjack/CocoaLumberjack.h>

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

#define DICTIONARY_HAS_VALUE(dic) (dic && [dic isKindOfClass:[NSDictionary class]] && [dic count] > 0)
#define STRING_HAS_VALUE(str)                         \
        (str && [str isKindOfClass:[NSString class]] && \
        [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)
#define ARRAY_HAS_VALUE(array) (array && [array isKindOfClass:[NSArray class]] && [array count] > 0)

#endif /* BACommonMacro_h */
