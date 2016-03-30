//
//  WordViewController.h
//  Braille2English
//
//  Created by Vinod Rathod on 13/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrailleCollectionViewCell.h"


@interface WordViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, BrailleCollectionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)numberToggleSwitched:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *numberSwitch;
@property (weak, nonatomic) IBOutlet UIButton *scanningTapped;
@end
