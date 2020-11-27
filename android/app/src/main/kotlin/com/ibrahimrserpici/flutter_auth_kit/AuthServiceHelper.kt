package com.ibrahimrserpici.flutter_auth_kit


import com.huawei.agconnect.auth.AGConnectAuth
import com.huawei.agconnect.auth.EmailAuthProvider
import com.huawei.agconnect.auth.EmailUser
import com.huawei.agconnect.auth.VerifyCodeSettings
import io.flutter.plugin.common.MethodChannel
import java.util.*

class AuthServiceHelper {

    private  var verifyCodeSettings : VerifyCodeSettings

    init {

        verifyCodeSettings = VerifyCodeSettings.newBuilder()
                .action(VerifyCodeSettings.ACTION_REGISTER_LOGIN)
                .sendInterval(30)
                .locale(Locale.getDefault())
                .build()

    }




    public fun requestVerificationCode(email: String, result: MethodChannel.Result)
    {
        var task = EmailAuthProvider.requestVerifyCode(email,verifyCodeSettings)

        task.addOnSuccessListener {
            result.success("Verification Code Sent Successfully. " +
                    "\nPlease check your e mail for the code.")
        }

        task.addOnFailureListener {
            result.error(" ",it.localizedMessage,it)
        }
    }

    public fun registerWithEmail(email: String, password: String, verificationCode:String, result: MethodChannel.Result)
    {
        var userEmail = EmailUser.Builder()
                .setEmail(email)
                .setPassword(password)
                .setVerifyCode(verificationCode)
                .build()

        AGConnectAuth.getInstance().createUser(userEmail)
                .addOnSuccessListener {
                    result.success("Registration is Successful")


                    // Signing out here because I do not want to sign in automatically on successful registration
                    signOut()

                }
                .addOnFailureListener {
                    result.error(" ",it.localizedMessage,it)
                }


    }

    public fun login(email: String, password: String, result: MethodChannel.Result)
    {
        val credidential = EmailAuthProvider.credentialWithPassword(email, password)

        AGConnectAuth.getInstance().signIn(credidential)
                .addOnSuccessListener {
                    result.success("Login Successful")
                }
                .addOnFailureListener {
                    result.error(" ",it.localizedMessage,it)
                }
    }


    public fun signOut()
    {
        AGConnectAuth.getInstance().signOut()
    }
}