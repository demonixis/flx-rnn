package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class MenuState extends FlxState 
	{
		private var _background:FlxSprite;
		private var _forground:FlxSprite;
		
		
		public function MenuState() 
		{
			
		}
		
		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundMenu);
			add(_background);
			
			_forground = new FlxSprite(0, 0, Asset.ForgroundMenu);
			add(_forground);
		}
		
	}

}