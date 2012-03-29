package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class PlayState extends FlxState 
	{
		private var _background:FlxSprite;
		private var _player:Player;
		
		public function PlayState() 
		{
			
		}

		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundBoard1);
			add(_background);
			
			_player = new Player(100, 100);
			add(_player);
		}
		
		
		
	}

}