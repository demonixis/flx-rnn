package 
{
	import flxRnn.Constant;
	import org.flixel.FlxGame;
	import flxRnn.state.PlayState;
	import flxRnn.state.MenuState;
	
	[SWF(width="800", height="600", backgroundColor="#00000000")]
	public class Main extends FlxGame 
	{
		public function Main()
		{
			Constant.Scores = new Array(5);
			for (var i:int = 0; i < 5; i++)
			{
				Constant.Scores[i] = 0;
			}
			
			super(800, 600, flxRnn.state.MenuState, 1);
		}
	}
	
}