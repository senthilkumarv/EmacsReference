//
//  ERTableDetailCell.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERTableDetailCell : UITableViewCell {
    UITextView *commandText;
    UILabel *commandKey;
}
@property(nonatomic, retain) IBOutlet UITextView *commandText;
@property(nonatomic, retain) IBOutlet UILabel *commandKey;
@end
