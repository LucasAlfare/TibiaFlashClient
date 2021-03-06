﻿package shared.stage3D
{
    import flash.geom.*;

    public class Camera2D extends Object
    {
        protected var m_UpdateCamera:Boolean = true;
        protected var m_RenderMatrixOrthogonal:Matrix3D;
        private var m_Zoom:Number = 1;
        protected var m_SceneWidth:Number;
        protected var m_RenderMatrixPerspective:Matrix3D;
        protected var m_PerspectiveProjectionMatrix:Matrix3D;
        protected var m_OrthogonalProjectionMatrix:Matrix3D;
        protected var m_SceneHeight:Number;
        private var m_OffsetX:Number = 0;
        private var m_OffsetY:Number = 0;
        protected var m_ViewMatrix:Matrix3D;

        public function Camera2D(param1:Number, param2:Number)
        {
            this.m_RenderMatrixOrthogonal = new Matrix3D();
            this.m_RenderMatrixPerspective = new Matrix3D();
            this.m_PerspectiveProjectionMatrix = new Matrix3D();
            this.m_OrthogonalProjectionMatrix = new Matrix3D();
            this.m_ViewMatrix = new Matrix3D();
            this.m_SceneWidth = param1;
            this.m_SceneHeight = param2;
            this.m_UpdateCamera = true;
            this.m_OrthogonalProjectionMatrix = this.makeOrtographicMatrix(0, param1, 0, param2);
            return;
        }// end function

        public function reset() : void
        {
            var _loc_1:* = 0;
            this.offsetY = 0;
            this.offsetX = _loc_1;
            this.zoom = 1;
            return;
        }// end function

        public function set offsetX(param1:Number) : void
        {
            this.m_UpdateCamera = true;
            this.m_OffsetX = param1;
            return;
        }// end function

        public function get sceneHeight() : Number
        {
            return this.m_SceneHeight;
        }// end function

        public function set offsetY(param1:Number) : void
        {
            this.m_UpdateCamera = true;
            this.m_OffsetY = param1;
            return;
        }// end function

        public function get zoom() : Number
        {
            return this.m_Zoom;
        }// end function

        protected function makeOrtographicMatrix(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 1) : Matrix3D
        {
            return new Matrix3D(this.Vector.<Number>([2 / (param2 - param1), 0, 0, 0, 0, 2 / (param3 - param4), 0, 0, 0, 0, 1 / (param6 - param5), 0, 0, 0, param5 / (param5 - param6), 1]));
        }// end function

        public function get offsetX() : Number
        {
            return this.m_OffsetX;
        }// end function

        public function get sceneWidth() : Number
        {
            return this.m_SceneWidth;
        }// end function

        public function getViewProjectionMatrix(param1:Boolean = true) : Matrix3D
        {
            if (this.m_UpdateCamera)
            {
                this.m_UpdateCamera = false;
                this.m_ViewMatrix.identity();
                this.m_ViewMatrix.appendTranslation((-this.sceneWidth) / 2 - this.offsetX, (-this.sceneHeight) / 2 - this.offsetY, 0);
                this.m_ViewMatrix.appendScale(this.zoom, this.zoom, 1);
                this.m_RenderMatrixOrthogonal.identity();
                this.m_RenderMatrixOrthogonal.append(this.m_ViewMatrix);
                this.m_RenderMatrixPerspective.identity();
                this.m_RenderMatrixPerspective.append(this.m_ViewMatrix);
                this.m_RenderMatrixOrthogonal.append(this.m_OrthogonalProjectionMatrix);
                this.m_RenderMatrixPerspective.append(this.m_PerspectiveProjectionMatrix);
            }
            return param1 ? (this.m_RenderMatrixOrthogonal) : (this.m_RenderMatrixPerspective);
        }// end function

        public function get offsetY() : Number
        {
            return this.m_OffsetY;
        }// end function

        public function set zoom(param1:Number) : void
        {
            this.m_UpdateCamera = true;
            this.m_Zoom = param1;
            return;
        }// end function

    }
}
