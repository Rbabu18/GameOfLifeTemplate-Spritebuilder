//
//  Creature.m
//  GameOfLife
//
//  Created by Ramesh Babu on 28/06/2014.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"
#import "CCAnimation.h"

#define MAX_ANIMATION_FRAMES 5

@implementation Creature
- (instancetype)initCreature {
    // since we made Creature inherit from CCSprite, 'super' below refers to CCSprite
    self = [super initWithImageNamed:@"ccbResources/GameOfLifeAssets/Assets/bubble.png"];
    
    if (self) {
        self.isAlive = NO;
        [self animateCreature];
    }
    
    return self;
}

- (void)setIsAlive:(BOOL)newState {
    
    //when you create an @property as we did in the .h, an instance variable with a leading underscore is automatically created for you
    _isAlive = newState;
    
    // 'visible' is a property of any class that inherits from CCNode. CCSprite is a subclass of CCNode, and Creature is a subclass of CCSprite, so Creatures have a visible property
    self.visible = _isAlive;
}

-(void) animateCreature {
    
    NSMutableArray *animationFrames = [NSMutableArray array];
    
    for(int i = 0; i <= MAX_ANIMATION_FRAMES; ++i)
    {
        CCSpriteFrame *spriteFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"ccbResources/GameOfLifeAssets/Assets/bubble%d.png", i]];
        [animationFrames addObject: spriteFrame];
    }
    
    
    //Create an animation from the set of frames you created earlier
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:animationFrames delay:1.0f];
    
    //Create an action with the animation that can then be assigned to a sprite
    CCActionAnimate *animationAction = [CCActionAnimate actionWithAnimation:animation];
    
    CCActionRepeatForever *repeatingAnimation = [CCActionRepeatForever actionWithAction:animationAction];
    [self runAction:repeatingAnimation];
}
@end
