//Author : io
//import library
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h> 

//WiFiMulti Library
  ESP8266WiFiMulti WiFiMulti;

  //deklarasi variable
  int loket1 = D1;
  
  //int loket2 = D2;
  //int loket3 = D3;
  //int loket4 = D4;
  

//procedure antrian
  bool RFID();
  void pushButton();

void setup() {
  // put your setup code here, to run once:
    //mendefiniskan Serial dalam 9600
    Serial.begin(9600);
//<=============================================================== WIFI CONNECTION =====================================>
    // set Wifi SSID dan passwordnya
    WiFiMulti.addAP("SUPERWIFI--WEB OOS", "jeungnaon102030");

//<=============================================================== PIN DEFINITION =====================================>    
    //pinMode
    pinMode(D8,OUTPUT);
    pinMode(D7,OUTPUT);

    //definiskan pin untuk loket dan set input
    pinMode(loket1,INPUT);
    pinMode(loket2,INPUT);
    pinMode(loket3,INPUT);
    pinMode(loket4,INPUT);
}




void loop() {
    // put your main code here, to run repeatedly:
    //kondisi akan dieksekusi apabila mikrokontroller terhubung dengan wifi
    if((WiFiMulti.run()==WL_CONNECTED))
    {

      RFID();
      if (RFID()==true)
      {
          pushButton();  
      
      }

       
    }

   
//akhir procedure loop
delay(2000);
}



bool RFID()
{

  Serial.println("");
      //mendeteksikan RFID
      HTTPClient httpRFID;

      //membuat httpclient untuk RFID membaca lastfeed
      httpRFID.begin("http://agnosthings.com/f9cba400-74c0-11e6-8001-005056805279/field/last/feed/730/dataRFID");

      //mengambil data header http
      int httpCodeTest= httpRFID.GET();
         
      //jka code header dari http tidak bernilai negatif, maka httpCodeTest Tidak terdapat ERROR  
      if(httpCodeTest>0)
      {
                     //parsing json
                     Serial.printf("[HTTP] GET... code: %d\n", httpCodeTest);
                     String json = httpRFID.getString();
                     Serial.println(json);

                        //jika value json sama dengan 0, maka data RFID terbaca
                        if (json == "{\"value\":\"1\",\"code\":200}")
                        {
                        
                                  Serial.println("DATA DITERIMA");
                                  Serial.println("RFID TERDETEKSI"); 
                                  
                                  // led berkedip 2 kali sebagai indikasi bahwa RFID berhasil dibaca
                                  digitalWrite(D8,HIGH);
                                  delay(1050);
                                  digitalWrite(D8,LOW);
                                  delay(1050);
                                  digitalWrite(D8,HIGH);
                                  delay(1050);
                                  digitalWrite(D8,LOW);

            
                                  //notifikasi tombol untuk ditekan
                                  Serial.println("Menunggu tombol ditekan");

                                   //httpRFID.end();   
                                   
                                   // ambil nilai digital 
                                  digitalRead(loket1);

                                  //procedure tambah data
                                    return true;
                         
                         

                          }               
                          else                
                          {
                                                                    
                                                Serial.println("RFID TIDAK TERDETEKSI");
                                                digitalWrite(D7,HIGH);
                                                delay(2000);
                                                digitalWrite(D7,LOW);
                                                return false;

                           }
      
       } 
       
       else

       {
        
          Serial.printf("[HTTP]GET.... httpcode ERROR : %s", httpRFID.errorToString(httpCodeTest).c_str());
        
       }

        //tutup HTTP dan akhir if httpCodeTest
       httpRFID.end();
  
}



//procedure kirim data
void pushButton()
{
  
                          //jika tombol ditekan
                          if(loket1==HIGH)
                          {

                                //menyalakan lampu sebagai indikasi selama 1,5 detik
                                 Serial.println("Tombol Telah Ditekan");
                                 
                                 digitalWrite(D8,HIGH);
                                 delay(1000;
                        
                                 //mematikan led kembali setelah 1,5 detik
                                 digitalWrite(D8,LOW);

                                 
                                 //identifier url dengan API send data channel
                                 String url = "http://agnosthings.com/9be2e52a-74bf-11e6-8001-005056805279/feed?push=Counting1=1";
                                  
                                 
                                 //Mendapatkan informasi CODE buat http 
                                  httpRFID.begin(url);

                                   Serial.println(httpRFID.begin(url));                                    
                                 //jika httpcode tidak minus maka tidak ada error yang terjadi 
                                           
                                           if(httpCodeTest>0)
                                           {
                                               // panggil API                                            
                                               Serial.println("LOKET 1 PUSH DATA");
                                           }
                                            else
                                           {
                                                Serial.println("Data tidak dikirim"); 
                                                digitalWrite(D7,HIGH);
                                                delay(2000);
                                                digitalWrite(D7,LOW);
                                                //HTTP CODE JIKA TERJADI ERROR DALAM httpCodeTest
                                                Serial.printf("[HTTP] GET ERROR CODE : %s\n",httpRFID.errorToString(httpCodeTest).c_str());
                                               
                                           }

                 
                                
                                
                          }                                                           
                          else
                          {
                                                Serial.println("Tombol tidak ditekan");        
                          }


}


  
