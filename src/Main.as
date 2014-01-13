package 
{
	import com.gestureworks.away3d.TouchManager3D;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import com.gestureworks.cml.core.CMLAway3D;
	CMLAway3D;
	ModelPopup;
	ModelGallery;
	ModelButton;

	[SWF(width = "1920", height = "1080", backgroundColor = "0x000000", frameRate = "60")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			cml = "library/cml/main.cml";
			// THERE ARE SOME TOUCH GESTURES IN THE MOTION GERSTURE LIBRARY
			gml = "library/gml/multimodal_gestures.gml";
			
			// INITIALIZE LEAP INTO 3D MODE BY DEFAULT
			leap3D = true;
			
			//INITIALIZED WIIMOTE
			wiimote = true; //turn on wiimote support
			sensor = true;  //then init sensor
			
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");			
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			TouchManager3D.initialize();
			var mg:ModelGallery = new ModelGallery;			
			stage.addChildAt(mg, 0);
			mg.init();
		}

	}
}