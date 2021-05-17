#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray.count == 0) {
        return @"";
    }
    
    NSMutableArray<NSNumber *> *ip = @[@0, @0, @0, @0].mutableCopy;
    
    for (int i = 0; i < numbersArray.count && i < 4; i++) {
        NSNumber *number = numbersArray[i];
        if (number == nil) {
            return @"Is not number";
        } else if (number.integerValue < 0) {
            return @"Negative numbers are not valid for input.";
        } else if (number.integerValue > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        ip[i] = number;
    }
    
    return [NSString stringWithFormat:@"%@.%@.%@.%@", ip[0], ip[1], ip[2], ip[3]];
}

@end
