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
	

	<instantiate from="root/src/app_package/SplashActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
		
	<instantiate from="root/src/app_package/MainActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/${mainActivityClass}.java" /> 

	<instantiate from="root/res/layout/splash_activity.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
		
	<instantiate from="root/res/layout/activity_main.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${mainActivityLayoutName}.xml" />
	
	<copy from="root/res/drawable-xxhdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />
			
	<merge from="root/res/values/styles.xml.ftl"
			to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
	<merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
			       
 	<open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
	
</recipe>
