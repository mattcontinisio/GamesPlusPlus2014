package item 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Bullet extends FlxSprite
	{
		public function Bullet( X:Number, Y:Number ) 
		{
			super( X, Y );
			makeGraphic( 20, 20, 0xffffffff );
			
			flicker( -1 );
		}
		
		public override function update():void
		{
			super.update();
		}
	}

}