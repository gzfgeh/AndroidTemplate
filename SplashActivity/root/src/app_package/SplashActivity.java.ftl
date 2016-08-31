package  ${packageName};

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;
import com.bumptech.glide.Glide;

import java.util.concurrent.TimeUnit;

import rx.Observable;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;

public class ${activityClass} extends AppCompatActivity{
    private static final int STARTUP_DELAY = 300; // 启动延迟
    private static final int ANIM_ITEM_DURATION = 1000;

    private ImageView tempPage;
    private ImageView ivLogo;
    private TextView tvLogoText;
    private ViewPropertyAnimatorCompat viewAnimator;
    private int secondTime = ${secondTime};

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${activityLayoutName});

        tempPage = (ImageView) findViewById(R.id.temp_page);
		ivLogo = (ImageView) findViewById(R.id.onboard_iv_logo);
        tvLogoText = (TextView) findViewById(R.id.tv_logo_text);
        logoAnimation();
		
		Glide.with(${activityClass}.this)
                .load("http://img.my.csdn.net/uploads/201309/01/1378037235_7476.jpg")
                .into(tempPage);

        Observable.timer(secondTime, TimeUnit.SECONDS, AndroidSchedulers.mainThread())
                .subscribe(new Subscriber<Object>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {
                        startActivity(new Intent(${activityClass}.this, MainActivity.class));
                        finish();
                    }

                    @Override
                    public void onNext(Object o) {
                        tvLogoText.setVisibility(View.GONE);
                        ivLogo.setVisibility(View.GONE);
                        tempPage.setVisibility(View.VISIBLE);

                        Observable.timer(secondTime, TimeUnit.SECONDS, AndroidSchedulers.mainThread())
                                .map(new Func1<Long, Object>() {
                                    @Override
                                    public Object call(Long aLong) {
                                        startActivity(new Intent(SplashActivity.this, MainActivity.class));
                                        finish();
                                        return aLong;
                                    }
                                }).subscribe();

                    }
                });
		
    }
	
	/**
     *  向上移动
     */
    private void logoAnimation(){
        ViewCompat.animate(ivLogo)
                .translationY(-200)
                .setStartDelay(STARTUP_DELAY)
                .setDuration(ANIM_ITEM_DURATION)
                .setInterpolator(new DecelerateInterpolator(1.2f))
                .start();

        viewAnimator = ViewCompat.animate(tvLogoText)
                .translationY(100).alpha(1)
                .setStartDelay(500)
                .setDuration(1000);
        viewAnimator.setInterpolator(new DecelerateInterpolator()).start();
    }
}
