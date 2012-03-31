package 
{
	import org.flixel.FlxGame;
	import flxRnn.state.PlayState;
	import flxRnn.state.MenuState;
	
	[SWF(width="800", height="600", backgroundColor="#00000000")]
	public class Main extends FlxGame 
	{
		public function Main()
		{
			super(800, 600, flxRnn.state.PlayState, 1);
		}
	}
	
}