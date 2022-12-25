#include "DHT.h"
#include "LiquidCrystal.h"
#include <FirebaseESP32.h>
#include "ESP32_MailClient.h"
#include <Wire.h>
#include <Adafruit_BMP085.h>
#include <WiFi.h>

//components pins
#define DHT11_PIN 33
#define LDR 35
LiquidCrystal lcd(19, 23, 18, 17, 16, 15);
#define led_bazzer 12

//constant data
#define BMP_PRESURE_IN_HPA(pres) (pres / 100)
#define LDR_THRESHOLD 500

//firebase
#define FIREBASE_HOST "FIREBASE_HOST_LINK"
#define FIREBASE_Authorization_key "FIREBASE_PASSWORD"

//wifi
#define WIFI_SSID "SSID_HERE" 
#define WIFI_PASSWORD "PASSWORD_HERE" 

//email
#define emailSenderAccount    "weatherstationt050@gmail.com"
#define emailSenderPassword   "mkukrilsvetkcwbu"
#define smtpServer            "smtp.gmail.com"
#define smtpServerPort        465
#define emailSubject          "[ALERT] ESP32"

//variables
DHT dht(DHT11_PIN, DHT11);
Adafruit_BMP085 bmp;
FirebaseData firebaseData;
int alert = 0;
float minTempVal;
float maxTempVal;
float minHumiVal;
float maxHumiVal;
float minAltVal;
float maxAltVal;
float minPresVal;
float maxPresVal;
String Email;
bool emailSent ;
SMTPData smtpData;
bool led_toggle = false;

void setup() {
  
  pinMode(led_bazzer,OUTPUT);
  Serial.begin(9600);
  lcd.begin(16, 2);
  dht.begin();
  WiFi.begin (WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting...");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  Firebase.begin(FIREBASE_HOST,FIREBASE_Authorization_key);

  if (!bmp.begin()) {
	  Serial.println("Could not initialize bmp");
  }
}
 
void loop() {

  int ldr_value = analogRead(LDR);
  
  if(ldr_value<LDR_THRESHOLD){
    Firebase.setString(firebaseData, "/ESP32_APP/TIME","Night");
  }else{
    Firebase.setString(firebaseData,"/ESP32_APP/TIME","Day");
  }

  float temp = bmp.readTemperature();
  String temperature = String(temp, 0) + "C";
  float humi = dht.readHumidity();
  String humidity = String(humi, 0) + "%";
  String dhtReadings = "[" + temperature + " | " + humidity + " ]";

  float alti = bmp.readAltitude();
  String altitude = String(alti, 0) + "M";
  int32_t pres = BMP_PRESURE_IN_HPA(bmp.readPressure());
  String presure = String(pres) + "hPa";
  String bmpReadings = "[" + altitude + " | " + presure + "]";
 
  if (Firebase.getFloat(firebaseData, "ESP32_APP/minTempVal")) {
        minTempVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/maxTempVal")) {
        maxTempVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/minHumiVal")) {
        minHumiVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/maxHumiVal")) {
        maxHumiVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/minAltVal")) {
        minAltVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/maxAltVal")) {
        maxAltVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/minPresVal")) {
        minPresVal = firebaseData.floatData();
  }
  if (Firebase.getFloat(firebaseData, "ESP32_APP/maxPresVal")) {
        maxPresVal = firebaseData.floatData();
  }
  if (Firebase.getInt(firebaseData, "ESP32_APP/emailSent")) {
        emailSent = firebaseData.intData();
  }
  if( temp < minTempVal || temp > maxTempVal||
      humi < minHumiVal || humi > maxHumiVal||
      alti < minAltVal  || alti > maxAltVal ||
      pres < minPresVal || pres > maxPresVal ){
        if(emailSent){
        String emailMessage = "Something is going wrong Temprature : " + String(temp) + " Humidity : "
                                + String(humi) +" Altitude : "+String(alti)+" Air Pressure : " + String(pres);
        if(sendEmailNotification(emailMessage)){
          Serial.println("Email Sent");
          emailSent = 0;
        }else {
        Serial.println("Email Failed");
        }
        }
        alert=1;
        if(led_toggle){
          digitalWrite(led_bazzer,HIGH);
          led_toggle = false;
        }else{
          digitalWrite(led_bazzer,LOW);
          led_toggle = true;
        }
  
  }else{
    digitalWrite(led_bazzer, LOW);
    alert=0;
  }



  lcd.setCursor(0, 0);
  lcd.print(dhtReadings);
  lcd.setCursor(0, 1);
  lcd.print(bmpReadings);

  Firebase.setFloat(firebaseData, "/ESP32_APP/TEMPERATURE",temp);
  Firebase.setFloat(firebaseData, "/ESP32_APP/HUMIDITY", humi);
  Firebase.setFloat(firebaseData, "/ESP32_APP/ALTITUDE", alti);
  Firebase.setFloat(firebaseData, "/ESP32_APP/PRESSURE", pres);
  Firebase.setInt(firebaseData,"/ESP32_APP/ALERT",alert);
  Firebase.setInt(firebaseData,"/ESP32_APP/emailSent",emailSent);
    
  delay(1000);
}

bool sendEmailNotification(String emailMessage){
  smtpData.setLogin(smtpServer, smtpServerPort, emailSenderAccount, emailSenderPassword);
  smtpData.setSender("ESP32", emailSenderAccount);
  smtpData.setPriority("High");
  smtpData.setSubject(emailSubject);
  smtpData.setMessage(emailMessage, true);
  Firebase.getString(firebaseData, "ESP32_APP/email");
  Email = firebaseData.stringData();
  smtpData.addRecipient(Email);
  smtpData.setSendCallback(sendCallback);
  if (!MailClient.sendMail(smtpData)) {
    Serial.println("Error sending Email, " + MailClient.smtpErrorReason());
    return false;
  }
  smtpData.empty();
  return true;
}

void sendCallback(SendStatus msg) {
  Serial.println(msg.info());
  if (msg.success()) {
    Serial.println("----------------");
  }
}
