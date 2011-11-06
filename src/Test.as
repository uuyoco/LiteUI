package
{
import com.xin.components.base.LiteSprite;
import flash.display.Sprite;

/**
 * @author daichangxin
 */
public class Test extends Sprite
{
	public function Test()
	{
		var sprite:LiteSprite = new LiteSprite(20, 200);
		addChild(sprite);
		trace(sprite.width, sprite.height);
	}
}
}
