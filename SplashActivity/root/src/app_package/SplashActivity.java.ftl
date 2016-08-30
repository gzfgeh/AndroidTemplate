package  ${packageName};

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.support.v7.app.AppCompatActivity;

import com.bumptech.glide.Glide;

import java.util.concurrent.TimeUnit;

import rx.Observable;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;

public class ${activityClass} extends AppCompatActivity
{
    private ImageView startPage;
	private ImageView tempPage;
    private int secondTime = ${secondTime};

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${activityLayoutName});

        startPage = (ImageView) findViewById(R.id.start_page);
        tempPage = (ImageView) findViewById(R.id.temp_page);
		
		Glide.with(${activityClass}.this)
                .load("http://img.my.csdn.net/uploads/201309/01/1378037235_7476.jpg")
                .placeholder(R.drawable.startpage)
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
                        startPage.setVisibility(View.GONE);
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
}
