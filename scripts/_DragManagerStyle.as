﻿package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class _DragManagerStyle extends Object
    {
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_150103613:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragMove_150103613;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_677079413:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragReject_677079413;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_150928065:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragCopy_150928065;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_150141528:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragLink_150141528;

        public function _DragManagerStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("DragManager");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("DragManager", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_150141528;
                this.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_677079413;
                this.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_150928065;
                this.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_150103613;
                this.defaultDragImageSkin = DefaultDragImage;
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
