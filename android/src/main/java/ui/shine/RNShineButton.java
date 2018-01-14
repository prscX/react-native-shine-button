
package ui.shine;

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

import com.sackcentury.shinebuttonlib.ShineButton;

public class RNShineButton extends ViewGroupManager<ViewGroup> {

  public static final String REACT_CLASS = "RNShineButton";

  @Override
  public String getName() {
    return REACT_CLASS;
  }


  @Override
  protected LinearLayout createViewInstance(ThemedReactContext reactContext) {

    ShineButton shineButtonJava = new ShineButton(reactContext.getCurrentActivity());
    shineButtonJava.setBtnColor(Color.GRAY);
    shineButtonJava.setBtnFillColor(Color.RED);
    shineButtonJava.setShapeResource(R.raw.heart);
    shineButtonJava.setAllowRandomColor(true);
    shineButtonJava.setClickable(true);

    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(60, 60);
    shineButtonJava.setLayoutParams(layoutParams);

//    LinearLayout linearLayout = new LinearLayout(reactContext);
//    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(100, 100);
//    if (linearLayout != null) {
//      linearLayout.addView(shineButtonJava);
//    }

    LinearLayout frameLayout = new LinearLayout(reactContext);
    frameLayout.addView(shineButtonJava, 60, 60);
    frameLayout.setClickable(true);

    return frameLayout;
  }
}