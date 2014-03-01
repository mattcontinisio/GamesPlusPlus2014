package player
{
	import flash.display.TriangleCulling;
	import flash.utils.setTimeout;
	import item.*;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../../assets/sounds/jump.mp3")] public var SndJump: Class;
		[Embed(source = "../../assets/sounds/shoot.mp3")] public var SndShoot: Class;
		
		// 1 or 2
		public var playerNum:int;
		
		public var currentItem:Item;
		
		public var bulletGroup:FlxGroup;
		
		public var trapGroup:FlxGroup;
		
		public var lap:uint;
		
		public var points:int;
		
		public function Player( X:Number, Y:Number, PlayerNum:int, bulletGroup:FlxGroup, trapGroup:FlxGroup )
		{
			super( X, Y );
			
			this.playerNum = playerNum;
			this.bulletGroup = bulletGroup;
			this.trapGroup = trapGroup;
			
			// Physics
			maxVelocity.x = 400;
			maxVelocity.y = 800;
			acceleration.y = 800;
			drag.x = maxVelocity.x * 4;
			
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
			setTimeout( resetPhysics, 2000 );
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
				var bullet:Bullet = new Bullet( -1000, -1000 );
				if ( facing == LEFT )
				{
					bullet.x = x - ( bullet.width ) - 40;
					bullet.y = y + ( height / 2 );
					bullet.velocity.x = -800;
				}
				else
				{
					bullet.x = x + width + 40;
					bullet.y = y + ( height / 2 );
					bullet.velocity.x = 800;
				}
				
				FlxG.play( SndShoot, 0.5 );
				bulletGroup.add( bullet );
				
				currentItem.useItem();
				
				if ( (currentItem as Gun).ammo <= 0 )
				{
					currentItem = null;
				}
			}
			else if ( currentItem is Trap )
			{
				var trap:Trap = currentItem as Trap;
				
				trap.x = x - 40;
				trap.y = y;
				trap.velocity.x = -20;
				trap.velocity.y = -20;
				
				trapGroup.add( trap );
				
				currentItem = null;
			}
		}
		
		public function resetPhysics():void
		{
			maxVelocity.x = 300;
		}
	}

}