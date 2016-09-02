apply plugin: 'me.tatarka.retrolambda'
apply plugin: 'com.neenbedankt.android-apt'

android{
	compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}

dependencies {
    apt 'com.google.dagger:dagger-compiler:2.0.2'
    provided 'javax.annotation:javax.annotation-api:1.2'
}