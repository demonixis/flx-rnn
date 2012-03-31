package flxRnn
{
	public class MathHelper 
	{
		private static var _instance:MathHelper = null;
		
		public function MathHelper() 
		{
			
		}
		
		public static function get instance():MathHelper
		{
			if (_instance == null)
				_instance = new MathHelper();
				
			return _instance;
		}
		
		public function getAngle(px:Number, py:Number, mx:Number, my:Number):Number
		{
			var opposite:Number = my - py;
			var adjacent:Number = mx - px;
			var tan:Number = opposite / adjacent;
			
			var radian:Number = Math.atan(tan);
			var degree:Number = 90 + toDegree(radian);
			
			if (adjacent < 0)
				degree -= 180
				
			return degree;
		}
		
		public function toRadian(degValue:Number):Number
		{
			return Math.PI * degValue / 180;
		}
		
		public function toDegree(radValue:Number):Number
		{
			return 180 * radValue / Math.PI;
		}
	}

}