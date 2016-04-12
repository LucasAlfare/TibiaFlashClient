﻿package tibia.magic.spellListWidgetClasses
{
    import mx.core.*;
    import shared.utility.*;
    import tibia.game.*;
    import tibia.magic.*;

    public class SpellListWidgetContextMenu extends ContextMenuBase
    {
        private var widget:SpellListWidget = null;
        private static const BUNDLE:String = "SpellListWidget";
        private static const SORT_OPTIONS:Array = [{value:SpellListWidget.SORT_NAME, label:"CTX_SORT_NAME"}, {value:SpellListWidget.SORT_PROFESSION, label:"CTX_SORT_PROFESSION"}, {value:SpellListWidget.SORT_LEVEL, label:"CTX_SORT_LEVEL"}, {value:SpellListWidget.SORT_GROUP, label:"CTX_SORT_GROUP"}];

        public function SpellListWidgetContextMenu(param1:SpellListWidget)
        {
            this.widget = param1;
            if (this.widget == null)
            {
                throw new ArgumentError("SpellListWidgetContextMenu.SpellListWidgetContextMenu: Invalid widget.");
            }
            return;
        }// end function

        override public function display(param1:IUIComponent, param2:Number, param3:Number) : void
        {
            var a_Owner:* = param1;
            var a_StageX:* = param2;
            var a_StageY:* = param3;
            var i:int;
            while (i < SORT_OPTIONS.length)
            {
                
                if (this.widget.sortMode != SORT_OPTIONS[i].value)
                {
                    createTextItem(resourceManager.getString(BUNDLE, SORT_OPTIONS[i].label), closure(null, function (param1:SpellListWidget, param2:int, param3) : void
            {
                param1.sortMode = param2;
                return;
            }// end function
            , this.widget, SORT_OPTIONS[i].value));
                }
                i = (i + 1);
            }
            super.display(a_Owner, a_StageX, a_StageY);
            return;
        }// end function

    }
}
