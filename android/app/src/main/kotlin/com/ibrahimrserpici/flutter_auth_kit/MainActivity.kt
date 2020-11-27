package com.ibrahimrserpici.flutter_auth_kit


import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val  AUTH_SERVICE_CHANNEL = "AuthServiceChannel"

    private val  authServiceHelper = AuthServiceHelper()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, AUTH_SERVICE_CHANNEL)
                .setMethodCallHandler { call, result ->

                    when (call.method) {
                        "registerWithEmail" -> {

                            authServiceHelper.registerWithEmail(call.argument<String>("email")!!
                                    ,call.argument<String>("password")!!
                                    ,call.argument<String>("verificationCode")!!
                                    , result)

                        }
                        "requestVerificationCode" -> {

                            authServiceHelper.requestVerificationCode(call.argument<String>("email")!!
                                    ,result)

                        }
                        "login" -> {

                            authServiceHelper.login(call.argument<String>("email")!!
                                    ,call.argument<String>("password")!!
                                    ,result)

                        }



                    }



                }
    }




}
