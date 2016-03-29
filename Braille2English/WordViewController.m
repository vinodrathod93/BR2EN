//
//  WordViewController.m
//  Braille2English
//
//  Created by Vinod Rathod on 13/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import "WordViewController.h"
#import "BrailleCharModel.h"

@interface WordViewController ()
{
    NSMutableDictionary *_tappedCells;
    BrailleCharModel *_model;
    BOOL _isNumberToggleOn;
}

@end

@implementation WordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.layer.cornerRadius = 5.f;
    self.collectionView.layer.masksToBounds = YES;
    
    self.resultLabel.layer.cornerRadius = 5.f;
    self.resultLabel.layer.masksToBounds = YES;
    

    _tappedCells = [[NSMutableDictionary alloc] init];
    _model = [[BrailleCharModel alloc] init];
    _isNumberToggleOn = NO;
    
    for (int i = 0; i < 18; i++) {
        
        NSString *labelString = self.resultLabel.text;
        self.resultLabel.text = [labelString stringByAppendingString:@" "];
    }
    
    NSLog(@"String length %lu", self.resultLabel.text.length);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionView

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 18;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"brailleCollectionViewCell";
    
    BrailleCollectionViewCell *cell = (BrailleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.tag = indexPath.item;
    
    
    
    NSArray *selections = [_tappedCells objectForKey:@(indexPath.item)];
    
    if (selections == nil) {
        selections = @[@0,@0,@0,@0,@0,@0];
    }
    
    NSLog(@"Index %lu and array %@", indexPath.item , selections);
    
    cell.selections =  [NSMutableArray arrayWithArray:selections];
    [cell decorateButtonsWithSelections:selections];
    
    
    cell.delegate = self;
    
    return cell;
    
}



#pragma mark - Braille Cell Delegate

-(void)brailleDotSelected:(BrailleCollectionViewCell *)cell {
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    NSString *letter;
    if (_isNumberToggleOn) {
        letter = [_model numberCharacterFrom:cell.selections];
    }
    else
        letter = [_model englishCharacterFrom:cell.selections];
    
    
    
    NSLog(@"%@", cell.selections);
    
    NSString *currentString = self.resultLabel.text;
    
    NSRange range = NSMakeRange(indexPath.item, 1);
    
    
    if ([letter isEqualToString:@""]) {
        letter = @" ";
    }
    
    self.resultLabel.text = [currentString stringByReplacingCharactersInRange:range withString:letter];
    
    
    [_tappedCells setObject:cell.selections forKey:@(indexPath.item)];
    
}



- (IBAction)numberToggleSwitched:(UISwitch *)sender {
    
    _isNumberToggleOn = sender.isOn;
    
    NSLog(@"Switch is %d", _isNumberToggleOn);
}
@end
