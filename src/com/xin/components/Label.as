package com.xin.components
{
import flash.filters.GlowFilter;
import flash.text.TextField;
import flash.text.TextFormat;
/**
 * 标签文本
 * @author daichangxin
 * 
 */
public class Label extends TextField
{
	private var _format:TextFormat;
	private var _strokeColor:int;
	
	public function Label(text:String = "", color:uint = 0x0, strokeColor:int = -1, fontSize:int = 12)
	{
		this.text = text;
		tabEnabled = selectable = mouseEnabled = mouseWheelEnabled = false;
		autoSize = "left";
		
		//描边
		if (_strokeColor != -1)
		{
			filters = [new GlowFilter(strokeColor, 1, 2, 2, 10)];
		}
		
		//字体样式
		_format = new TextFormat("宋体");
		_format.color = color;
		_format.size = fontSize;
		
		defaultTextFormat = _format;
	}
	
	public override function get width():Number
	{
		return textWidth;
	}
	
	public override function get height():Number
	{
		return textHeight;
	}
}
}