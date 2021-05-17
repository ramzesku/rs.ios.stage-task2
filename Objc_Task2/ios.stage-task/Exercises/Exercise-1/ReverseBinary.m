#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSString *string = @"" ;
    UInt8 x = n;

    while (x>0) {
        string = [string stringByAppendingString:[NSString stringWithFormat: @"%d", x&1]];
        x = x >> 1;
    }
    
    while ([string length] < 8) {
        string = [string stringByAppendingString: @"0"];
    }
    
    UInt8 result = strtol([string UTF8String], NULL, 2);
    return result;
}
