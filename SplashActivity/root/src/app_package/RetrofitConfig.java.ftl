package  ${packageName}.Model;

import ${packageName}.APP;
import ${packageName}.Bean.ApiConstants;
import ${packageName}.Utils.NetWorkUtils;
import ${packageName}.Utils.LogUtils;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;
import javax.inject.Singleton;

import okhttp3.Cache;
import okhttp3.CacheControl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

@Singleton
public class RetrofitConfig {
	/**
     * 缓存时间 7天
     */
    private static final int CACHE_TIME = 60 * 60 * 24 * 7;
	
    private RetrofitService retrofitService;

    private Interceptor interceptor = new Interceptor() {
        @Override
        public Response intercept(Chain chain) throws IOException {
            Request request = chain.request();
            if (!NetWorkUtils.isNetworkAvailable()){
                request = request.newBuilder().cacheControl(CacheControl.FORCE_CACHE).build();
            }
            Response response = chain.proceed(request);
            if (NetWorkUtils.isNetworkAvailable()){
                int maxAge = 0;
                response.newBuilder().header("Cache-Control", "public, max-age=" + maxAge)
                        .removeHeader("Pragma")
                        .build();
            }else{
                response.newBuilder().header("Cache-Control", "public, only-if-cached, max-stale=" + CACHE_TIME)
                        .removeHeader("Pragma")
                        .build();
            }

            return response;
        }
    };
	
	private final Interceptor loggingInterceptor = new Interceptor() {
        @Override
        public Response intercept(Chain chain) throws IOException {
            Request request = chain.request();
            long t1 = System.nanoTime();
            LogUtils.i(String.format("Sending request %s on %s%n%s", request.url(), chain.connection(), request.headers()));
            Response response = chain.proceed(request);
            long t2 = System.nanoTime();
            LogUtils.i(String.format(Locale.getDefault(), "Received response for %s in %.1fms%n%s",
                    response.request().url(), (t2 - t1) / 1e6d, response.headers()));
            return response;
        }
    };
	
	@Inject
    public RetrofitConfig() {
        File cacheFile = new File(APP.getContext().getCacheDir(), "OkHttpCache");
        Cache cache = new Cache(cacheFile, 1024 * 1024 * 100);
        OkHttpClient okHttpClient = new OkHttpClient.Builder()
                .connectTimeout(10000, TimeUnit.MILLISECONDS)
                .readTimeout(10000, TimeUnit.MILLISECONDS)
                .addInterceptor(interceptor)
				.addInterceptor(loggingInterceptor)
                .cache(cache)
                .build();

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(ApiConstants.GANK_IO_HOST)
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .addConverterFactory(GsonConverterFactory.create())
                .client(okHttpClient)
                .build();

        retrofitService = retrofit.create(RetrofitService.class);
    }

    public RetrofitService getRetrofitService(){
        return retrofitService;
    }
}