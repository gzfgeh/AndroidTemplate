<?xml version="1.0"?>
<recipe>
	<#include "../common/recipe_manifest.xml.ftl" />

	<instantiate from="root/src/app_package/SampleActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Activity/${activityName}.java" />
		
	<instantiate from="root/res/layout/activity_sample.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
		
		
	<instantiate from="root/src/app_package/NonePresenter.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Present/${presenterName}.java" />  

	<instantiate from="root/src/app_package/NoneView.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/View/${pageName}View.java" />   

	<instantiate from="root/src/app_package/NoneModel.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/Model/${pageName}Model.java" />

 	<open file="${escapeXmlAttribute(srcOut)}/Activity/${activityName}.java" />

</recipe>
