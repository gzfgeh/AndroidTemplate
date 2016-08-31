<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
	android:background="@color/colorPrimary"
    xmlns:tools="http://schemas.android.com/tools">

    <ImageView
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:id="@+id/temp_page"
        android:scaleType="centerCrop"
        android:visibility="gone"/>
		
	<ImageView
        android:id="@+id/onboard_iv_logo"
        android:layout_width="120dp"
        android:layout_height="120dp"
        android:layout_gravity="center"
        android:contentDescription="@null"
        android:src="@drawable/img_face"
        tools:visibility="visible"/>

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:alpha="0"
        android:text="Hello World!"
        android:textColor="@android:color/white"
        android:textSize="22sp"
        tools:alpha="1"
        android:id="@+id/tv_logo_text"/>

</FrameLayout>