#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

typedef NS_ENUM(NSUInteger, ArrayType) {
    mixed,
    string,
    number,
    unknown
};

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    // Get Array type
    ArrayType arrayType = [self getArrayType:array];
    if (arrayType != string && arrayType != number) {
        return @[];
    }
    
    // Create one array
    NSMutableArray *result = [NSMutableArray new];
    for (NSArray *arrayItems in array) {
        for (NSObject *item in arrayItems) {
            [result addObject:item];
        }
    }
    
    // Sort Array array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [result sortedArrayUsingDescriptors:sortDescriptors];
    return sortedArray;
}

- (ArrayType)getArrayType:(NSArray<NSArray *> *)array {
    NSString *type = nil;
    
    for (int i=0; i<array.count; i++) {
        NSString *itemsType = NSStringFromClass([array[i] class]);
        
        // Check array[i] is Array
        if (![itemsType isEqualToString:@"__NSArrayI"]) { return unknown; }
        
        for (NSObject *items in array[i]) {
            NSString *itemsType = NSStringFromClass([items class]);
            if (type == nil) { type = itemsType; }
            if (![itemsType isEqualToString:type]) { return mixed; }
        }
    }
    
    if ([type isEqualToString:@"__NSCFConstantString"]) {
        return string;
    } else if ([type isEqualToString:@"__NSCFNumber"]) {
        return number;
    }
    return unknown;
}

@end
