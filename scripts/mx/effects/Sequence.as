﻿package mx.effects
{
    import mx.effects.effectClasses.*;

    public class Sequence extends CompositeEffect
    {
        static const VERSION:String = "3.6.0.21751";

        public function Sequence(param1:Object = null)
        {
            super(param1);
            instanceClass = SequenceInstance;
            return;
        }// end function

        override protected function initInstance(param1:IEffectInstance) : void
        {
            super.initInstance(param1);
            return;
        }// end function

    }
}
