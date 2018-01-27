package  ${packageName}.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.TextView;
import org.reactivestreams.Subscription;

import com.bumptech.glide.Glide;
import ${packageName}.Present.SplashPresent;
import ${packageName}.Utils.ShareUtils;
import ${packageName}.View.SplashView;
import ${packageName}.R;

import java.util.concurrent.TimeUnit;


import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;

public class ${activityClass} extends BaseActivity<SplashPresent> implements SplashView{
    private static final int STARTUP_DELAY = 300; // 启动延迟
    private static final int ANIM_ITEM_DURATION = 2000;

    private ImageView tempPage;
    private ImageView ivLogo;
    private TextView tvLogoText;
    private ViewPropertyAnimatorCompat viewAnimator;
    private int secondTime = ${secondTime};

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${activityLayoutName});
        presenter.getUrl();

        tempPage = (ImageView) findViewById(R.id.temp_page);
		ivLogo = (ImageView) findViewById(R.id.onboard_iv_logo);
        tvLogoText = (TextView) findViewById(R.id.tv_logo_text);
        logoAnimation();
    }

    @Override
    protected void inject() {
        super.inject();
        getActivityComponent().inject(this);
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
                .setDuration(ANIM_ITEM_DURATION);
        viewAnimator.setInterpolator(new DecelerateInterpolator()).start();
    }
	
	@Override
    public void getUrlData(String data) {
        Glide.with(SplashActivity.this)
                .load(data)
                .into(tempPage);

        Flowable.timer(secondTime, TimeUnit.SECONDS, AndroidSchedulers.mainThread())
                .subscribe(new FlowableSubscriber<Long>() {
                    @Override
                    public void onSubscribe(@NonNull Subscription subscription) {

                    }

                    @Override
                    public void onNext(Long aLong) {
                        tvLogoText.setVisibility(View.GONE);
                        ivLogo.setVisibility(View.GONE);
                        goToNextActivity();
                    }

                    @Override
                    public void onError(Throwable throwable) {
                        goToNextActivity();
                    }

                    @Override
                    public void onComplete() {

                    }
                });
    }

    @Override
    public void onFail(String msg) {

    }

    private void goToNextActivity(){
        boolean isComeOver = ShareUtils.getValue("isComeOver", false);
        if (isComeOver){
            startActivity(new Intent(SplashActivity.this, MainActivity.class));
        }else{
            startActivity(new Intent(SplashActivity.this, LaunchActivity.class));
        }
        finish();
    }
}
