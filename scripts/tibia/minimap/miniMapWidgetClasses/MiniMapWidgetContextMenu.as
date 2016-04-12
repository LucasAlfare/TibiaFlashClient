﻿package tibia.minimap.miniMapWidgetClasses
{
    import mx.core.*;
    import tibia.game.*;
    import tibia.minimap.*;

    public class MiniMapWidgetContextMenu extends ContextMenuBase
    {
        protected var m_MiniMapStorage:MiniMapStorage;
        protected var m_PositionX:int = 0;
        protected var m_PositionY:int = 0;
        protected var m_PositionZ:int = 0;

        public function MiniMapWidgetContextMenu(param1:MiniMapStorage, param2:int, param3:int, param4:int)
        {
            if (param1 == null)
            {
                throw new ArgumentError("MiniMapWidgetContextMenu.MiniMapWidgetContextMenu: Invalid mini-map storage.");
            }
            this.m_MiniMapStorage = param1;
            this.m_PositionX = param2;
            this.m_PositionY = param3;
            this.m_PositionZ = param4;
            return;
        }// end function

        override public function display(param1:IUIComponent, param2:Number, param3:Number) : void
        {
            var a_Owner:* = param1;
            var a_StageX:* = param2;
            var a_StageY:* = param3;
            if (this.m_MiniMapStorage.getMark(this.m_PositionX, this.m_PositionY, this.m_PositionZ) == null)
            {
                createTextItem(resourceManager.getString(MiniMapWidgetView.BUNDLE, "CTX_SET_MARK"), function (param1) : void
            {
                var _loc_2:* = new EditMarkWidget();
                _loc_2.setMiniMapStorage(m_MiniMapStorage);
                _loc_2.setPosition(m_PositionX, m_PositionY, m_PositionZ);
                _loc_2.show();
                return;
            }// end function
            );
            }
            else
            {
                createTextItem(resourceManager.getString(MiniMapWidgetView.BUNDLE, "CTX_EDIT_MARK"), function (param1) : void
            {
                var _loc_2:* = new EditMarkWidget();
                _loc_2.setMiniMapStorage(m_MiniMapStorage);
                _loc_2.setPosition(m_PositionX, m_PositionY, m_PositionZ);
                _loc_2.show();
                return;
            }// end function
            );
                createTextItem(resourceManager.getString(MiniMapWidgetView.BUNDLE, "CTX_CLEAR_MARK"), function (param1) : void
            {
                m_MiniMapStorage.removeMark(m_PositionX, m_PositionY, m_PositionZ);
                return;
            }// end function
            );
            }
            super.display(a_Owner, a_StageX, a_StageY);
            return;
        }// end function

    }
}
