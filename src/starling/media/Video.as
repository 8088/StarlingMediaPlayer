package starling.media
{
	import flash.media.Camera;
	import flash.net.NetStream;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	/**
	 * Starling Video
	 *
	 * @author 8088
	 */
	public class Video extends Image
	{
		
		public function Video(width:int = 320, height:int = 240)
		{
			super(Texture.fromColor(width, height, 0));
		}
		
		public function attachCamera(camera:Camera):void
		{
			_texture = Texture.fromCamera(camera, 1, onComplete);
		}
		
		public function attachNetStream(netStream:NetStream):void
		{
			_texture = Texture.fromNetStream(netStream, 1, onComplete);
		}
		
		public function clear():void
		{
			_texture.dispose();
		}
		
		public function get deblocking():int
		{
			return _deblocking;
		}
		
		public function set deblocking(value:int):void
		{
			_deblocking = value;
			//..
		}
		
		public function get smoothing():Boolean
		{
			return _smoothing;
		}
		
		public function set smoothing(value:Boolean):void
		{
			_smoothing = value;
			//..
			if(_smoothing) this.textureSmoothing = TextureSmoothing.TRILINEAR;
			else this.textureSmoothing = TextureSmoothing.NONE;
		}
		
		public function get videoWidth():Number
		{
			return this.texture.width;
		}
		
		public function get videoHeight():Number
		{
			return this.texture.height;
		}
		
		
		// Internals..
		//
		protected function onComplete():void
		{
			this.texture = _texture;
		}
		
		private var _texture:Texture;
		
		private var _deblocking:int;
		private var _smoothing:Boolean;
	}

}