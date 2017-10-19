﻿package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _ApplicationControlBarStyle extends Object
    {

        public function _ApplicationControlBarStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("ApplicationControlBar");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("ApplicationControlBar", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.shadowDistance = 5;
                this.paddingBottom = 4;
                this.paddingRight = 8;
                this.dropShadowEnabled = true;
                this.fillColors = [16777215, 16777215];
                this.paddingTop = 5;
                this.borderStyle = "applicationControlBar";
                this.docked = false;
                this.fillAlphas = [0, 0];
                this.paddingLeft = 8;
                this.cornerRadius = 5;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
