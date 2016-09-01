package  ${packageName};

import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;

import ${packageName}.Utils.LogUtils;

public class APP extends Application {
    private static Context context;

    public static APP get(Context context) {
        return (APP) context.getApplicationContext();
    }

    public static Context getContext(){
        return context;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        context = getApplicationContext();
        if (debugMode()){
            LogUtils.LEVEL = 0;
        }else{
            LogUtils.LEVEL = LogUtils.NOTHING;
        }

    }

    private static boolean debugMode(){
        ApplicationInfo info = getContext().getApplicationInfo();
        if ((info.flags & ApplicationInfo.FLAG_DEBUGGABLE) != 0) {
            return true;
        }else{
            return false;
        }
    }
}