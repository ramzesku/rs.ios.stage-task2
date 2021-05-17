#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {

    NSMutableArray *numbers = [NSMutableArray new];
    NSMutableArray *strings = [NSMutableArray new];
    
    for (int i=0; i<array.count; i++) {
        if (![array[i] isKindOfClass:[NSArray class]]) {
            return @[];
        }
        
        for (NSObject *items in array[i]) {
            if ([items isKindOfClass:[NSString class]]) {
                [strings addObject:items];
            } else if ([items isKindOfClass:[NSNumber class]]) {
                [numbers addObject:items];
            }
        }
    }
    
    NSSortDescriptor *sortAscending = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    NSArray *arrayAscending = [NSArray arrayWithObject:sortAscending];
    NSSortDescriptor *sortDescending = [[NSSortDescriptor alloc] initWithKey:nil ascending:NO];
    NSArray *arrayDescending = [NSArray arrayWithObject:sortDescending];
    
    NSMutableArray *result = [NSMutableArray new];
    if (numbers.count > 0 && strings.count > 0) {
        NSArray *sortedNumbers = [numbers sortedArrayUsingDescriptors:arrayAscending];
        NSArray *sortedStrings = [strings sortedArrayUsingDescriptors:arrayDescending];
        result = @[sortedNumbers, sortedStrings].mutableCopy;
    } else if (numbers.count > 0) {
        NSArray *sortedNumbers = [numbers sortedArrayUsingDescriptors:arrayAscending];
        result = sortedNumbers.mutableCopy;
    } else if (strings.count > 0) {
        NSArray *sortedStrings = [strings sortedArrayUsingDescriptors:arrayAscending];
        result = sortedStrings.mutableCopy;
    }
    
    return result;
}

@end
