package level 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Portal extends FlxSprite
	{
		[Embed(source = "../assets/images/test_tilemap.png")] public var ImgTestTilemap:Class;
		
		public function Portal( X:Number, Y:Number ) 
		{
			super( X, Y );
		}
	}
}