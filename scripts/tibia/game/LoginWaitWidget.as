package tibia.game
{
   import flash.utils.getTimer;
   import flash.events.TimerEvent;
   import mx.events.CloseEvent;
   import mx.controls.Text;
   
   public class LoginWaitWidget extends MessageWidget
   {
      
      private static const BUNDLE:String = "Tibia";
      
      public static const TIMOUT_EXPIRED:int = 2147483647;
       
      protected var m_ShowTimestamp:Number = -1;
      
      private var m_UncommittedTimeout:Boolean = false;
      
      protected var m_Timeout:Number = 0;
      
      private var m_UIConstructed:Boolean = false;
      
      protected var m_UITimeout:Text = null;
      
      private var m_UncommittedMessage:Boolean = false;
      
      public function LoginWaitWidget()
      {
         super();
         buttonFlags = PopUpBase.BUTTON_ABORT;
         keyboardFlags = PopUpBase.KEY_ESCAPE;
         title = resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TITLE");
      }
      
      public function get timeout() : Number
      {
         return this.m_Timeout;
      }
      
      public function set timeout(param1:Number) : void
      {
         if(this.m_Timeout != param1)
         {
            this.m_Timeout = param1;
            this.m_UncommittedTimeout = true;
            invalidateProperties();
         }
      }
      
      public function get remainingTime() : Number
      {
         if(this.m_ShowTimestamp > -1)
         {
            return this.m_ShowTimestamp + this.m_Timeout - getTimer();
         }
         return this.m_Timeout;
      }
      
      override public function show() : void
      {
         super.show();
         if(this.m_ShowTimestamp < 0)
         {
            this.m_ShowTimestamp = getTimer();
            Tibia.s_GetSecondaryTimer().addEventListener(TimerEvent.TIMER,this.onTimer);
         }
      }
      
      private function updateMessage(param1:int) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:String = null;
         if(param1 > 60000)
         {
            _loc2_ = Math.ceil(param1 / 60000);
            _loc3_ = _loc2_ == 1?resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TIMEOUT_MINUTE"):resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TIMEOUT_MINUTES");
         }
         else
         {
            _loc2_ = Math.ceil(param1 / 1000);
            _loc3_ = _loc2_ == 1?resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TIMEOUT_SECOND"):resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TIMEOUT_SECONDS");
         }
         m_UIMessage.htmlText = resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TEXT",[message]);
         this.m_UITimeout.htmlText = resourceManager.getString(BUNDLE,"DLG_LOGINWAIT_TIMEOUT",[_loc2_,_loc3_]);
      }
      
      protected function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:CloseEvent = null;
         if(param1 != null)
         {
            _loc2_ = this.remainingTime;
            if(_loc2_ <= 0)
            {
               _loc3_ = new CloseEvent(CloseEvent.CLOSE);
               _loc3_.detail = TIMOUT_EXPIRED;
               dispatchEvent(_loc3_);
            }
            else
            {
               this.updateMessage(_loc2_);
            }
         }
      }
      
      override protected function createChildren() : void
      {
         if(!this.m_UIConstructed)
         {
            super.createChildren();
            this.m_UITimeout = new Text();
            this.m_UITimeout.maxHeight = NaN;
            this.m_UITimeout.maxWidth = 300;
            this.m_UITimeout.percentHeight = 100;
            this.m_UITimeout.percentWidth = 100;
            addChild(this.m_UITimeout);
            this.m_UIConstructed = true;
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         var _loc1_:Boolean = false;
         if(this.m_UncommittedMessage)
         {
            _loc1_ = true;
            this.m_UncommittedMessage = false;
         }
         if(this.m_UncommittedTimeout)
         {
            _loc1_ = true;
            this.m_UncommittedTimeout = false;
         }
         if(_loc1_)
         {
            this.updateMessage(this.remainingTime);
         }
      }
      
      override public function set message(param1:String) : void
      {
         if(message != param1)
         {
            super.message = param1;
            this.m_UncommittedMessage = true;
            invalidateProperties();
         }
      }
      
      override public function close(param1:Boolean) : void
      {
         super.close(param1);
         if(this.m_ShowTimestamp > -1)
         {
            this.m_ShowTimestamp = -1;
            Tibia.s_GetSecondaryTimer().removeEventListener(TimerEvent.TIMER,this.onTimer);
         }
      }
   }
}