#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger difference = number.integerValue;
    NSInteger count = 0;
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = i + 1; j < array.count; j++) {
            if (labs(array[j].integerValue - array[i].integerValue) == difference) {
                count++;
            }
        }
    }
    return count;
}

@end
