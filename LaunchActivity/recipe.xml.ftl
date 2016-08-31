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
	

	<instantiate from="root/src/app_package/LaunchActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

	<instantiate from="root/res/layout/activity_launch.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
	
	<instantiate from="root/src/app_package/SimpleFragment.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Fragment/SimpleFragment.java" /> 
		
	<instantiate from="root/src/app_package/GuideViewPager.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Widget/GuideViewPager.java" />
		
	<instantiate from="root/src/app_package/LauncherBaseFragment.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Interface/LauncherBaseFragment.java" />
		
	<instantiate from="root/src/app_package/BaseFragmentAdapter.java.ftl"
        to="${escapeXmlAttribute(srcOut)}/Adapter/BaseFragmentAdapter.java" /> 
	
	<copy from="root/res/drawable-xxhdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />
			
	<merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
			       
 	<open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
	
</recipe>
