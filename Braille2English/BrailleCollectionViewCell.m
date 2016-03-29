//
//  BrailleCollectionViewCell.m
//  Braille2English
//
//  Created by Vinod Rathod on 13/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import "BrailleCollectionViewCell.h"

@implementation BrailleCollectionViewCell {
    NSArray *_copiedButtons;
}



-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"Nib Buttons == %lu", (unsigned long)self.brailleButtons.count);
    
    _copiedButtons = self.brailleButtons;
    
    _selections = [[NSMutableArray alloc] init];
    
    for (int i=0; i < _copiedButtons.count; i++) {
        [_selections addObject:[NSNumber numberWithBool:NO]];
    }
    
    
    
    
}


-(void)layoutSubviews {
    [super layoutSubviews];
    
}

- (IBAction)braillePressed:(UIButton *)sender {
    
    // Toggle Selection
    sender.selected = !sender.selected;
    
    // Change image of button
    [self changeButtonImage:sender];
    
    NSLog(@"Before tap %@", _selections);
    
    // Handle selections
    NSUInteger index = [_copiedButtons indexOfObject:sender];
    [_selections replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:sender.selected]];
    
    
    NSLog(@"After tap %@", _selections);
    
    // Respond to delegate method
    if ([_delegate respondsToSelector:@selector(brailleDotSelected:)]) {
        [_delegate brailleDotSelected:self];
    }
}


#pragma mark - Helper Methods

-(void)changeButtonImage:(UIButton *)sender {
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"dark_dot"] forState:UIControlStateNormal];
    }
    else
        [sender setImage:[UIImage imageNamed:@"polo_dot"] forState:UIControlStateNormal];
}


-(void)decorateButtonsWithSelections:(NSArray *)selections {
    
    [_copiedButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BOOL isSelected = [self cellSelections:selections isSelectedAtIndex:idx];
        [button setSelected:isSelected];
        
        [self changeButtonImage:button];
    }];
}


-(void)undecorateButtons {
    [_copiedButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [button setSelected:NO];
        [self changeButtonImage:button];
    }];
}


-(BOOL)cellSelections:(NSArray *)selections isSelectedAtIndex:(NSUInteger)index {
    
    return [[selections objectAtIndex:index] boolValue];
}

@end
