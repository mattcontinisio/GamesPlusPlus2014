package player
{
	import flash.utils.setTimeout;
	import item.*;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player extends FlxSprite
	{
		// 1 or 2
		public var playerNum:int;
		
		public var currentItem:Item;
		
		public var bulletGroup:FlxGroup;
		
		public var lap:uint;
		
		public function Player( X:Number, Y:Number, PlayerNum:int, bulletGroup:FlxGroup )
		{
			super( X, Y );
			
			this.playerNum = playerNum;
			this.bulletGroup = bulletGroup;
			
			// Physics
			maxVelocity.x = 300;
			maxVelocity.y = 800;
			acceleration.y = 800;
			drag.x = maxVelocity.x * 4;
			
			// Test item
			//this.currentItem = new SpeedBoost( this );
			//this.currentItem = new Gun( this );
			
			lap = 0;
		}
		
		public override function update():void
		{			
			super.update();
		}
		
		public function punched():void
		{
			maxVelocity.x = 50;
			velocity.y = -300;
			velocity.x -= 500;
			setTimeout( resetPhysics, 1000 );
		}
		
		public function useItem():void
		{
			if ( currentItem == null )
			{
				return;
			}
			
			if ( currentItem is SpeedBoost )
			{
				var oldMax:Number = maxVelocity.x;
				maxVelocity.x = 1000;
				setTimeout( resetPhysics, 1000 );
				
				currentItem.useItem();
				
				currentItem = null;
			}
			else if ( currentItem is Gun )
			{
				var bullet:Bullet = new Bullet( x + 100, y + ( height / 2 ) );
				if ( facing == LEFT )
				{
					bullet.x = x - ( velocity.x * FlxG.elapsed ) - ( bullet.width ) - 40;
					bullet.velocity.x = -600;
				}
				else
				{
					bullet.x = x + width + ( velocity.x * FlxG.elapsed  ) + 40;
					bullet.velocity.x = 600;
				}
				
				bulletGroup.add( bullet );
				
				currentItem.useItem();
				
				if ( (currentItem as Gun).ammo <= 0 )
				{
					currentItem = null;
				}
			}
		}
		
		public function resetPhysics():void
		{
			maxVelocity.x = 300;
		}
	}

}