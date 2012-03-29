package 
{
	import org.flixel.FlxGame;
	
	[SWF(width="800", height="600", backgroundColor="#00000000")]
	[Frame(factoryClass="Preloader")];
	public class Main extends FlxGame 
	{
		public function Main()
		{
			super(800, 600, PlayState, 1);
		}
	}
	
}