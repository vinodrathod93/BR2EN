//
//  BrailleCharModel.m
//  Braille2English
//
//  Created by Vinod Rathod on 12/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import "BrailleCharModel.h"

@implementation BrailleCharModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"Initialized");
    }
    return self;
}


#pragma mark -
#pragma mark - Alphabet
#pragma mark -

-(NSDictionary *)alphabetsData {
    NSDictionary *brailleDict = @{
                                  @" "  : @[@0,@0,@0,@0,@0,@0],
                                  @"a"  : @[@1,@0,@0,@0,@0,@0],
                                  @"b"  : @[@1,@1,@0,@0,@0,@0],
                                  @"c"  : @[@1,@0,@0,@1,@0,@0],
                                  @"d"  : @[@1,@0,@0,@1,@1,@0],
                                  @"e"  : @[@1,@0,@0,@0,@1,@0],
                                  @"f"  : @[@1,@1,@0,@1,@0,@0],
                                  @"g"  : @[@1,@1,@0,@1,@1,@0],
                                  @"h"  : @[@1,@1,@0,@0,@1,@0],
                                  @"i"  : @[@0,@1,@0,@1,@0,@0],
                                  @"j"  : @[@0,@1,@0,@1,@1,@0],
                                  @"k"  : @[@1,@0,@1,@0,@0,@0],
                                  @"l"  : @[@1,@1,@1,@0,@0,@0],
                                  @"m"  : @[@1,@0,@1,@1,@0,@0],
                                  @"n"  : @[@1,@0,@1,@1,@1,@0],
                                  @"o"  : @[@1,@0,@1,@0,@1,@0],
                                  @"p"  : @[@1,@1,@1,@1,@0,@0],
                                  @"q"  : @[@1,@1,@1,@1,@1,@0],
                                  @"r"  : @[@1,@1,@1,@0,@1,@0],
                                  @"s"  : @[@0,@1,@1,@1,@0,@0],
                                  @"t"  : @[@0,@1,@1,@1,@1,@0],
                                  @"u"  : @[@1,@0,@1,@0,@0,@1],
                                  @"v"  : @[@1,@1,@1,@0,@0,@1],
                                  @"w"  : @[@0,@1,@0,@1,@1,@1],
                                  @"x"  : @[@1,@0,@1,@1,@0,@1],
                                  @"y"  : @[@1,@0,@1,@1,@1,@1],
                                  @"z"  : @[@1,@0,@1,@0,@1,@1]
                                
                                  
                                  };
    
    return brailleDict;
}




-(NSArray *)englishBrailleCharacters {
    return [[self alphabetsData] allValues];
}

-(NSArray *)englishCharacters {
    return [[self alphabetsData] allKeys];
}

-(NSString *)englishCharacterFrom:(NSArray *)braille {
    
    NSArray *brailles = [self englishBrailleCharacters];
    
    if ([brailles containsObject:braille]) {
        NSUInteger index = [brailles indexOfObject:braille];
        
        NSArray *englishCharacters = [self englishCharacters];
        
        NSString *letter = [englishCharacters objectAtIndex:index];
        
        return letter;
    }
    
    else
        return @"";
}



#pragma mark -
#pragma mark - Numbers
#pragma mark -

-(NSDictionary *)numbersData {
    NSDictionary *brailleNumberDict = @{
                                        @"0": @[@0,@0,@1,@0,@1,@1],
                                        @"1": @[@0,@1,@0,@0,@0,@0],
                                        @"2": @[@0,@1,@1,@0,@0,@0],
                                        @"3": @[@0,@1,@0,@0,@1,@0],
                                        @"4": @[@0,@1,@0,@0,@1,@1],
                                        @"5": @[@0,@1,@0,@0,@0,@1],
                                        @"6": @[@0,@1,@1,@0,@1,@0],
                                        @"7": @[@0,@1,@1,@0,@1,@1],
                                        @"8": @[@0,@1,@1,@0,@1,@0],
                                        @"9": @[@0,@0,@1,@0,@1,@0],
                                        
                                        };
    
    return brailleNumberDict;
}


-(NSArray *)numberBrailleCharacters {
    return [[self numbersData] allValues];
}

-(NSArray *)numberCharacters {
    return [[self numbersData] allKeys];
}

-(NSString *)numberCharacterFrom:(NSArray *)braille {
    NSArray *brailles = [self numberBrailleCharacters];
    
    if ([brailles containsObject:braille]) {
        NSUInteger index = [brailles indexOfObject:braille];
        
        NSArray *numberCharacters = [self numberCharacters];
        
        NSString *letter = [numberCharacters objectAtIndex:index];
        
        return letter;
    }
    
    else
        return @"";
}

@end
