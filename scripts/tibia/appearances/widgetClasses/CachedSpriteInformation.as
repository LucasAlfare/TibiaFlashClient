﻿package tibia.appearances.widgetClasses
{
    import flash.display.*;
    import flash.geom.*;
    import shared.utility.*;

    public class CachedSpriteInformation extends BitmapPart
    {
        private var m_CacheMiss:Boolean = true;
        private var m_IsAlternative:Boolean = false;
        private var m_SpriteID:uint = 0;
        private static var s_EmptyBitmap:BitmapData = new BitmapData(64, 64, true, 0);

        public function CachedSpriteInformation(param1:uint = 0, param2:BitmapData = null, param3:Rectangle = null, param4:Boolean = true, param5:Boolean = false)
        {
            this.setCachedSpriteInformationTo(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function get spriteID() : uint
        {
            return this.m_SpriteID;
        }// end function

        public function get isAlternative() : Boolean
        {
            return this.m_IsAlternative;
        }// end function

        public function setCachedSpriteInformationTo(param1:uint, param2:BitmapData, param3:Rectangle, param4:Boolean = true, param5:Boolean = false) : void
        {
            super.setBitmapPartTo(param2, param3);
            this.m_SpriteID = param1;
            this.m_CacheMiss = param4;
            this.m_IsAlternative = param5;
            return;
        }// end function

        public function set isAlternative(param1:Boolean) : void
        {
            this.m_IsAlternative = param1;
            return;
        }// end function

        public function reset() : void
        {
            this.m_SpriteID = 0;
            this.m_CacheMiss = true;
            this.m_IsAlternative = false;
            super.setBitmapPartTo(null, null);
            return;
        }// end function

        public function set cacheMiss(param1:Boolean) : void
        {
            this.m_CacheMiss = param1;
            if (param1 == true)
            {
                super.rectangle.x = 0;
                super.rectangle.y = 0;
                setBitmapPartTo(s_EmptyBitmap, this.rectangle);
            }
            return;
        }// end function

        public function get cacheMiss() : Boolean
        {
            return this.m_CacheMiss;
        }// end function

    }
}
