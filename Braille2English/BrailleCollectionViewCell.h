//
//  BrailleCollectionViewCell.h
//  Braille2English
//
//  Created by Vinod Rathod on 13/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BrailleCollectionDelegate <NSObject>

-(void)brailleDotSelected:(id)self;

@end

@interface BrailleCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *brailleButtons;
@property (weak, nonatomic) id<BrailleCollectionDelegate> delegate;
@property (retain, nonatomic) NSMutableArray *selections;

-(void)changeButtonImage:(UIButton *)sender;
-(void)decorateButtonsWithSelections:(NSArray *)selections;
-(void)undecorateButtons;

@end
