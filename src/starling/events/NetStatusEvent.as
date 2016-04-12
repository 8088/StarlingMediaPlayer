package starling.events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author 8088
	 */
	public class NetStatusEvent extends Event 
	{
		public static var NET_STATUS:String = "netStatus";
		public function NetStatusEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, info:Object = null) 
		{ 
			super(type, bubbles, cancelable);
			
			_info = info;
		} 
		
		public function get info():Object
		{
			return _info;
		}
		
		private var _info:Object;
	}
	
}