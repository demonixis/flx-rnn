package 
{
	import org.flixel.FlxGame;
	
	[SWF(width="800", height="600", backgroundColor="#00000000")]
	public class Main extends FlxGame 
	{
		public function Main()
		{
			super(800, 600, MenuState, 1, 60, 60);
		}
	}
	
}