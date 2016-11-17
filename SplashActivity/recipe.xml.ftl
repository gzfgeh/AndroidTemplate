<?xml version="1.0"?>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />

	<#if !appCompat && !(hasDependency('com.android.support:support-v4'))>
	        <dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/>
	    </#if>

	<#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
	       <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+" />
	</#if>

	<#if (buildApi gte 22) && appCompat && !(hasDependency('com.android.support:design'))>
	    <dependency mavenUrl="com.android.support:design:${buildApi}.+" />
	</#if>
	
	<dependency mavenUrl="io.reactivex:rxjava:1.1.4" />
	<dependency mavenUrl="io.reactivex:rxandroid:1.2.0" />
	<dependency mavenUrl="com.github.bumptech.glide:glide:3.7.0" />
	
	<dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:3.4.1" />
	<dependency mavenUrl="com.squareup.okhttp3:okhttp:3.4.1" />
	
	<dependency mavenUrl="com.squareup.retrofit2:retrofit:2.1.0" />
	<dependency mavenUrl="com.squareup.retrofit2:converter-gson:2.1.0" />
	<dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava:2.1.0" />
	<dependency mavenUrl="com.google.dagger:dagger:2.0.2" />
	<dependency mavenUrl="apt 'com.google.dagger:dagger-compiler:2.0.2'" />
	<dependency mavenUrl="provided 'org.glassfish:javax.annotation:10.0-b28'" />
	<dependency mavenUrl="com.zhy:autolayout:1.4.5" />
	<dependency mavenUrl="com.jakewharton:butterknife:8.4.0" />
	<dependency mavenUrl="apt 'com.jakewharton:butterknife-compiler:8.4.0'" />
	<dependency mavenUrl="compile 'com.github.gzfgeh:RecyclerView:V1.2'" />
	
	

	<instantiate from="root/src/app_package/SplashActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Activity/${activityClass}.java" />
		
	<instantiate from="root/src/app_package/MainActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Activity/${mainActivityClass}.java" /> 

	<instantiate from="root/res/layout/activity_splash.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
		
	<instantiate from="root/res/layout/activity_main.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${mainActivityLayoutName}.xml" />
		
	<instantiate from="root/src/app_package/LaunchActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Activity/${launchActivityClass}.java" />

	<instantiate from="root/res/layout/activity_launch.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${launchActivityLayoutName}.xml" />
	
	<instantiate from="root/src/app_package/SimpleFragment.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Fragment/SimpleFragment.java" /> 
		
	<instantiate from="root/res/layout/fragment_launch.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${fragmentLaunchLayoutName}.xml" />
		
	<instantiate from="root/src/app_package/GuideViewPager.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Widget/GuideViewPager.java" />
		
	<instantiate from="root/src/app_package/LauncherBaseFragment.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Interface/LauncherBaseFragment.java" />
		
	<instantiate from="root/src/app_package/BaseFragmentAdapter.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Adapter/BaseFragmentAdapter.java" />
		
		
		
	
	<instantiate from="root/src/app_package/BaseModel.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Model/BaseModel.java" />
		
	<instantiate from="root/src/app_package/RetrofitConfig.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Model/RetrofitConfig.java" /> 
		
	<instantiate from="root/src/app_package/RetrofitService.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Model/RetrofitService.java" />
		
	<instantiate from="root/src/app_package/SplashModel.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Model/SplashModel.java" />
	
	<instantiate from="root/src/app_package/BasePresenter.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Present/BasePresenter.java" />
		
	<instantiate from="root/src/app_package/Presenter.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Present/Presenter.java" />
		
	<instantiate from="root/src/app_package/SplashPresent.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Present/SplashPresent.java" />
		
	<instantiate from="root/src/app_package/LogUtils.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Utils/LogUtils.java" />
		
	<instantiate from="root/src/app_package/NetWorkUtils.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Utils/NetWorkUtils.java" />
		
	<instantiate from="root/src/app_package/RxUtils.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Utils/RxUtils.java" />
		
	<instantiate from="root/src/app_package/ShareUtils.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Utils/ShareUtils.java" /> 
	
	<instantiate from="root/src/app_package/BaseView.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/View/BaseView.java" />
		
	<instantiate from="root/src/app_package/SplashView.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/View/SplashView.java" />	
		
	<instantiate from="root/src/app_package/APP.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/APP.java" />	
		
	<instantiate from="root/src/app_package/ActivityComponent.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Component/ActivityComponent.java" />
	
	<instantiate from="root/src/app_package/ActivityComponentFactory.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Component/ActivityComponentFactory.java" />
		
	<instantiate from="root/src/app_package/ActivityScope.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Component/ActivityScope.java" />
		
	<instantiate from="root/src/app_package/ApplicationComponent.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Component/ApplicationComponent.java" />		
		
	<instantiate from="root/src/app_package/ActivityModule.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Module/ActivityModule.java" />
		
	<instantiate from="root/src/app_package/ApplicationModule.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Module/ApplicationModule.java" />	
		
	<instantiate from="root/src/app_package/BaseActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Activity/BaseActivity.java" />	
		
	<instantiate from="root/src/app_package/BaseBean.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Bean/BaseBean.java" />
		
	<instantiate from="root/src/app_package/ApiConstants.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Common/ApiConstants.java" />

		
	
	<copy from="root/res/drawable-xxhdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />
			
	<merge from="root/res/values/styles.xml.ftl"
			to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
	<merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
	<merge from="root/build.gradle.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />
			 
 	<open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
	
</recipe>
