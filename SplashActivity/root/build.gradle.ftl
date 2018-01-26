apply plugin: 'me.tatarka.retrolambda'
apply plugin: 'com.neenbedankt.android-apt'
apply plugin: 'android-apt'

android{
	compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
	
}

dependencies {
    apt 'com.google.dagger:dagger-compiler:2.0.2'
    apt 'com.jakewharton:butterknife-compiler:8.4.0'
    provided 'javax.annotation:javax.annotation-api:1.2'
}