//
//  FinishingStringTool.h
//  GoFar
//
//  Created by Pagani on 2019/12/12.
//  Copyright by Pagani. All. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ClearString)
+(void)LabelAttributedString:(UILabel*)label firstW:(NSString *)oneW toSecondW:(NSString *)twoW color:(UIColor *)color size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
