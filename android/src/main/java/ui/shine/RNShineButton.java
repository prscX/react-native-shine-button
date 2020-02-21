
package ui.shine;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.StrictMode;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.UIManagerModule;
import com.facebook.react.uimanager.ViewGroupManager;

import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.views.text.ReactFontManager;
import com.sackcentury.shinebuttonlib.ShineButton;

import java.lang.reflect.Method;
import java.util.Random;

public class RNShineButton extends ViewGroupManager<ViewGroup> {

  public static final String REACT_CLASS = "RNShineButton";

  private ThemedReactContext reactContext;

  private final String SHAPE_HEART = "heart";
  private final String SHAPE_LIKE = "like";
  private final String SHAPE_SMILE = "smile";
  private final String SHAPE_STAR = "star";

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  protected FrameLayout createViewInstance(final ThemedReactContext reactContext) {
    this.reactContext = reactContext;

    int randomId;

    Random rand = new Random();
    while (reactContext.getCurrentActivity().findViewById(randomId = rand.nextInt(Integer.MAX_VALUE) + 1) != null);
    final int viewId = randomId;

    final ShineButton shineButton = new ShineButton(reactContext.getCurrentActivity());
    final FrameLayout frameLayout = new FrameLayout(reactContext.getCurrentActivity());
    frameLayout.addView(shineButton);

    shineButton.setOnCheckStateChangeListener(new ShineButton.OnCheckedChangeListener() {
      @Override
      public void onCheckedChanged(View view, boolean checked) {
       int id = frameLayout.getId();

        reactContext.getNativeModule(UIManagerModule.class).getEventDispatcher().dispatchEvent(
                new ShineButtonEvent(
                        id,
                        checked));
      }
    });

    return frameLayout;
  }

  @ReactProp(name = "size")
  public void setSize(FrameLayout shineButtonFrame, int size) {
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);

    float density = shineButtonFrame.getContext().getResources().getDisplayMetrics().density;
    int dpSize = Math.round(size * density);

    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(dpSize, dpSize);
    shineButton.setLayoutParams(layoutParams);
  }

  @ReactProp(name = "value")
  public void setValue(FrameLayout shineButtonFrame, boolean on){
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);
    shineButton.setChecked(on);
  }

  @ReactProp(name = "disabled", defaultBoolean = false)
  public void setEnabled(FrameLayout shineButtonFrame, boolean disabled) {
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);
    shineButton.setEnabled(!disabled);
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
  public void setShape(FrameLayout shineButtonFrame, ReadableMap shapeProps) {
    ShineButton shineButton = (ShineButton) shineButtonFrame.getChildAt(0);

    String shape = null;
    Drawable drawable = null;

    if (shapeProps.hasKey("shape")) {
      shape = shapeProps.getString("shape");
    } else {
      try {
        Class<?> clazz = Class.forName("prscx.imagehelper.RNImageHelperModule"); //Controller A or B
        Class params[] = {ReadableMap.class};
        Method method = clazz.getDeclaredMethod("GenerateImage", params);

        drawable = (Drawable) method.invoke(null, shapeProps);
      } catch (Exception e) {
      }

      shape = shapeProps.getString("name");
    }

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
      default:
        if (drawable != null) {
          shineButton.setShape(drawable);
        }
    }

    if (shineButton.isChecked()) {
      shineButton.setChecked(true);
    }
  }
}
