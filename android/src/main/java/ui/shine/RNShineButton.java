
package ui.shine;

import android.app.Activity;
import android.content.res.AssetManager;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;

import com.facebook.react.uimanager.annotations.ReactProp;
import com.sackcentury.shinebuttonlib.ShineButton;

public class RNShineButton extends ViewGroupManager<ViewGroup> {

  public static final String REACT_CLASS = "RNShineButton";

  private final String SHAPE_HEART = "heart";
  private final String SHAPE_LIKE = "like";
  private final String SHAPE_SMILE = "smile";
  private final String SHAPE_STAR = "star";


  @Override
  public String getName() {
    return REACT_CLASS;
  }


  @Override
  protected FrameLayout createViewInstance(ThemedReactContext reactContext) {

    ShineButton shineButton = new ShineButton(reactContext.getCurrentActivity());
    shineButton.setBtnFillColor(Color.RED);
    shineButton.setAllowRandomColor(true);

    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(100, 100);
    shineButton.setLayoutParams(layoutParams);

    FrameLayout frameLayout = new FrameLayout(reactContext.getCurrentActivity());
    frameLayout.addView(shineButton);

    return frameLayout;
  }

  @ReactProp(name = "color")
  public void setColor(FrameLayout shineButtonFrame, String color) {
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);
    shineButton.setBtnColor(Color.parseColor(color));
  }

  @ReactProp(name = "fillColor")
  public void setFillColor(FrameLayout shineButtonFrame, String fillColor) {
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);
    shineButton.setBtnFillColor(Color.parseColor(fillColor));
  }

  @ReactProp(name = "shape")
  public void setShape(FrameLayout shineButtonFrame, String shape) {
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);

    switch (shape) {
      case SHAPE_HEART:
        shineButton.setShapeResource(R.raw.heart);
        break;
      case SHAPE_LIKE:
        shineButton.setShapeResource(R.raw.like);
        break;
      case SHAPE_SMILE:
        shineButton.setShapeResource(R.raw.smile);
        break;
      case SHAPE_STAR:
        shineButton.setShapeResource(R.raw.star);
        break;
    }
  }
}