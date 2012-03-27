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
		private var background:FlxSprite;
		private var forground:FlxSprite;
		
		
		public function MenuState() 
		{
			
		}
		
		override public function create():void
		{
			background = new FlxSprite(0, 0, Neum.BackgroundMenu);
			add(background);
			
			forground = new FlxSprite(0, 0, Neum.ForgroundMenu);
			add(forground);
		}
		
	}

}