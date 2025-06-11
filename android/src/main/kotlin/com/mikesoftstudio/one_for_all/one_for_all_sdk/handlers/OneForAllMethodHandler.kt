package com.mikesoftstudio.one_for_all

import android.annotation.SuppressLint
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.net.wifi.WifiManager
import android.os.BatteryManager
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.provider.Settings
import android.telephony.TelephonyManager
import androidx.core.content.ContextCompat.getSystemService
import java.net.Inet4Address
import java.net.Inet6Address
import java.net.InetAddress
import java.net.NetworkInterface

class OneForAllMethodHandler(private val context: Context) : MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPlatformVersion" -> result.success("Android ${Build.VERSION.RELEASE}")
            "getBatteryInfo" -> {
                val batteryInfo = getBatteryInfo()

                result.success(batteryInfo)
            }

            "getDeviceInfo" -> {
                val deviceInfo = getDeviceInfo()
                result.success(deviceInfo)
            }

            "getNetworkInfo" -> {
                result.success(getNetworkInfo())

            }


            else -> result.notImplemented()
        }
    }






    private fun getBatteryInfo(): Map<String, Any> {
        val intent = ContextWrapper(context).registerReceiver(
            null,
            IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        )!!

        val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
        val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        val percentage = level * 100 / scale

        val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
        val chargingStatus = when (status) {
            BatteryManager.BATTERY_STATUS_CHARGING -> "Charging"
            BatteryManager.BATTERY_STATUS_DISCHARGING -> "Discharging"
            BatteryManager.BATTERY_STATUS_FULL -> "Full"
            BatteryManager.BATTERY_STATUS_NOT_CHARGING -> "Not Charging"
            else -> "Unknown"
        }

        val chargePlug = intent.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1)
        val chargingSource = when (chargePlug) {
            BatteryManager.BATTERY_PLUGGED_USB -> "USB"
            BatteryManager.BATTERY_PLUGGED_AC -> "AC"
            BatteryManager.BATTERY_PLUGGED_WIRELESS -> "Wireless"
            else -> "Unknown"
        }

        val health = when (intent.getIntExtra(BatteryManager.EXTRA_HEALTH, -1)) {
            BatteryManager.BATTERY_HEALTH_GOOD -> "Good"
            BatteryManager.BATTERY_HEALTH_OVERHEAT -> "Overheat"
            BatteryManager.BATTERY_HEALTH_DEAD -> "Dead"
            BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE -> "Over Voltage"
            BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE -> "Failure"
            else -> "Unknown"
        }

        val temperature = intent.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, -1) / 10.0
        val voltage = intent.getIntExtra(BatteryManager.EXTRA_VOLTAGE, -1)
        val technology = intent.getStringExtra(BatteryManager.EXTRA_TECHNOLOGY) ?: "Unknown"

        return mapOf(
            "level" to percentage,
            "status" to chargingStatus,
            "source" to chargingSource,
            "health" to health,
            "temperature" to temperature,
            "voltage" to voltage,
            "technology" to technology
        )
    }


    @SuppressLint("HardwareIds")
    private fun getDeviceInfo(): Map<String, String> {
        val packageInfo = context.packageManager.getPackageInfo(context.packageName, 0)

        return mapOf(
            "manufacturer" to Build.MANUFACTURER,
            "model" to Build.MODEL,
            "brand" to Build.BRAND,
            "device" to Build.DEVICE,
            "version_sdk" to Build.VERSION.SDK_INT.toString(),
            "version_release" to Build.VERSION.RELEASE,
            "android_id" to Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID),
            "app_version" to packageInfo.versionName,
            "package_name" to context.packageName
        )
    }

   @SuppressLint("DefaultLocale")
   private fun getNetworkInfo(): Map<String, Any> {
       // Use ContextCompat.getSystemService for a cleaner call
       val connectivityManager = getSystemService(context, ConnectivityManager::class.java)
       val wifiManager = context.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager // applicationContext is preferred for system services
       val telephonyManager = getSystemService(context, TelephonyManager::class.java)

       var connectionType = "None"
       var isConnected = false
       var wifiSSID = "Unavailable"
       var ipAddress = "Unavailable"
       var operatorName = "Unavailable"
       var isRoaming = false
       var networkType = "Unknown"

       if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
           val network = connectivityManager?.activeNetwork
           val capabilities = connectivityManager?.getNetworkCapabilities(network)

           if (capabilities != null) {
               isConnected = true
               when {
                   capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> {
                       connectionType = "WiFi"
                       wifiSSID = wifiManager.connectionInfo?.ssid ?: "Unknown"
                       val ip = wifiManager.connectionInfo?.ipAddress ?: 0
                       ipAddress = String.format(
                           "%d.%d.%d.%d",
                           ip and 0xff,
                           ip shr 8 and 0xff,
                           ip shr 16 and 0xff,
                           ip shr 24 and 0xff
                       )
                   }
                   capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> {
                       connectionType = "Mobile"
                       operatorName = telephonyManager?.networkOperatorName ?: "Unavailable"
                       isRoaming = telephonyManager?.isNetworkRoaming ?: false
                       networkType = getNetworkType(telephonyManager?.networkType ?: 0)
                       ipAddress = getLocalIpAddress()
                   }
               }
           }
       }

       return mapOf(
           "connectionType" to connectionType,
           "isConnected" to isConnected,
           "wifiSSID" to wifiSSID,
           "ipAddress" to ipAddress,
           "networkOperatorName" to operatorName,
           "isRoaming" to isRoaming,
           "networkType" to networkType
       )
   }

    private fun getNetworkType(type: Int): String {
        return when (type) {
            TelephonyManager.NETWORK_TYPE_LTE -> "4G"
            TelephonyManager.NETWORK_TYPE_NR -> "5G"
            TelephonyManager.NETWORK_TYPE_EDGE,
            TelephonyManager.NETWORK_TYPE_GPRS -> "2G"
            TelephonyManager.NETWORK_TYPE_UMTS,
            TelephonyManager.NETWORK_TYPE_HSDPA,
            TelephonyManager.NETWORK_TYPE_HSPA -> "3G"
            else -> "Unknown"
        }
    }

    private fun getLocalIpAddress(): String {
        try {
            val interfaces = NetworkInterface.getNetworkInterfaces()
            for (intf in interfaces) {
                val addresses = intf.inetAddresses
                for (addr in addresses) {
                    if (!addr.isLoopbackAddress) {
                        val ip = addr.hostAddress ?: continue

                        // Remove %interface part from IPv6
                        val cleanIp = ip.split("%").first()

                        // Prefer IPv4
                        if (addr is Inet4Address) return cleanIp
                        // Otherwise return cleaned IPv6
                        if (addr is Inet6Address) return cleanIp
                    }
                }
            }
        } catch (e: Exception) {
            return "Unavailable"
        }
        return "Unavailable"
    }



}
