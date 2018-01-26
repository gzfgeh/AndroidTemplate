buildscript {
    repositories {
        jcenter()
    }
    dependencies {
        classpath 'me.tatarka:gradle-retrolambda:3.2.4'
        classpath 'com.neenbedankt.gradle.plugins:android-apt:1.8'
        classpath 'com.fernandocejas.frodo:frodo-plugin:0.8.3'
    }
}

allprojects {
    repositories {
        jcenter()
		maven { url "https://jitpack.io" }
        maven {
            url "https://oss.sonatype.org/content/repositories/snapshots/"
        }
    }
}