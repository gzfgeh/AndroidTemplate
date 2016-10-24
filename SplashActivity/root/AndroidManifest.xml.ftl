<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" 
			package="${packageName}">

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

    <application
		android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:supportsRtl="true"
        android:theme="@style/AppTheme"
		android:name=".APP">
        <activity android:name=".Activity.SplashActivity"
            android:label="@string/app_name"
            android:theme="@style/SplashActivity"
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
		
		<meta-data android:name="design_width" android:value="1080">
        </meta-data>
        <meta-data android:name="design_height" android:value="1920">
        </meta-data>
		
		<activity android:name=".Activity.MainActivity" />
		<activity android:name=".Activity.LaunchActivity" />
    </application>
</manifest>
