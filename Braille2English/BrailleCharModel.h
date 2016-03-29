//
//  BrailleCharModel.h
//  Braille2English
//
//  Created by Vinod Rathod on 12/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrailleCharModel : NSObject

// Alphabets
-(NSDictionary *)alphabetsData;
-(NSArray *)englishBrailleCharacters;
-(NSArray *)englishCharacters;
-(NSString *)englishCharacterFrom:(NSArray *)braille;

// Numbers
-(NSDictionary *)numbersData;
-(NSArray *)numberBrailleCharacters;
-(NSArray *)numberCharacters;
-(NSString *)numberCharacterFrom:(NSArray *)braille;
@end
