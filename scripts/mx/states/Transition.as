﻿package mx.states
{
    import mx.effects.*;

    public class Transition extends Object
    {
        public var effect:IEffect;
        public var toState:String = "*";
        public var fromState:String = "*";
        static const VERSION:String = "3.6.0.21751";

        public function Transition()
        {
            return;
        }// end function

    }
}
