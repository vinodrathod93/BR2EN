//
//  ViewController.m
//  Braille2English
//
//  Created by Vinod Rathod on 09/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import "ViewController.h"
#import "BrailleCharModel.h"

@interface ViewController ()
{
    NSMutableArray *_selections;
    BrailleCharModel *_model;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.label.text = @"";
    self.label.layer.cornerRadius = 5.f;
    self.label.layer.borderColor    = [UIColor blackColor].CGColor;
    self.label.layer.borderWidth    = 1.5f;
    self.label.layer.masksToBounds  = YES;
    
    _selections = [[NSMutableArray alloc] init];
    
    for (int i=0; i < self.brailleButtons.count; i++) {
        [_selections addObject:[NSNumber numberWithBool:NO]];
    }
    
    
    [self.brailleButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BOOL isSelected = [self brailleButton:button isSelectedAtIndex:idx];
        [button setSelected:isSelected];
        
        [self changeButtonImage:button];
    }];
    
    
    _model = [[BrailleCharModel alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)brailleButtonsPressed:(UIButton *)sender {
    NSLog(@"brailleButtonsPressed %ld", (long)sender.tag);
    
    sender.selected = !sender.selected;
    
    [self changeButtonImage:sender];
    
    
    NSUInteger index = [self.brailleButtons indexOfObject:sender];
    
    NSLog(@"Sender index is %lu", (unsigned long)index);
    
    [_selections replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:sender.selected]];
    
    NSLog(@"Selection Array %@", _selections);
    
    
    NSString *letter = [_model englishCharacterFrom:_selections];
    
    self.label.text = letter;
    
}





#pragma mark - Helper Methods

-(void)changeButtonImage:(UIButton *)sender {
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"dark_dot"] forState:UIControlStateNormal];
    }
    else
        [sender setImage:[UIImage imageNamed:@"polo_dot"] forState:UIControlStateNormal];
}


-(BOOL)brailleButton:(UIButton *)button isSelectedAtIndex:(NSUInteger)index {
    return [[_selections objectAtIndex:index] boolValue];
}




@end
