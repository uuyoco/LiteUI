package com.xin.components.base
{
import flash.display.Sprite;
import flash.events.Event;
	/**
	 * 框架显示对象基类
	 * @author xin
	 * 
	 */	
	public class LiteSprite extends Sprite
	{
		protected var _width:Number;
		protected var _height:Number;
		protected var _enabled:Boolean = true;
		
		/**
		 * 标记是否需要draw, 避免重复draw, 初始值为true, 即下一帧将使用重绘
		 */		
		private var _blNeedDraw:Boolean = true;
		
		/**
		 * 构造方法
		 * @param w 宽度，-1表示子对象的实际宽度
		 * @param h 高度，-1表示子对象的实际高度
		 */		
		public function LiteSprite(w:int = -1, h:int = -1)
		{
			_width = w;
			_height = h;
			init();
		}
		
		protected function init():void
		{
			addChildren();
			draw();
		}
		
		/**
		 * 添加子显示对象
		 */		
		protected function addChildren():void{};
		
		/**
		 * 在下帧重绘
		 */		
		protected function invalidate():void
		{
			_blNeedDraw = true;
			addEventListener(Event.ENTER_FRAME, onInvalidate);
		}
		
		/**
		 * 绘制组件方法
		 */		
		public function draw():void{};
		
		/////////////////////////////////////////////
		// 事件处理函数
		/////////////////////////////////////////////
		private function onInvalidate(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, onInvalidate);
			
			if (_blNeedDraw == true)
			{
				draw();
				_blNeedDraw = false;
			}
		}
		
		/////////////////////////////////////////////
		// Getter & Setter
		/////////////////////////////////////////////
		/**
		 * 设置组件宽度
		 */		
		public override function set width(value:Number):void
		{
			_width = value;
			invalidate();
			dispatchEvent(new Event(Event.RESIZE));
		}
		public override function get width():Number
		{
			return _width < 0? super.width : _width;
		}
		
		/**
		 * 设置组件高度
		 */		
		public override function set height(value:Number):void
		{
			_height = value;
			invalidate();
			dispatchEvent(new Event(Event.RESIZE));
		}
		public override function get height():Number
		{
			return _height < 0? super.height : _height;
		}
		
		/**
		 * 是否可用
		 */		
		public function set enabled(value:Boolean):void
		{
			_enabled = mouseChildren = mouseEnabled = tabEnabled = value;
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
	}
}