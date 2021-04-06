# MPU6050 hareket sensörü ile Arduino'da hesapladığımız açıyı seri port ile MATLAB'a göndermek
İlk önce Arduino kodumuz olan **mpu6050_aciyi_bul_seri_porttan_gonder.ino** dosyasını Arduino'ya yükleyin.<br> 
Ardından MATLAB kodu olan **read_angle_serial_port.m** dosyasını doğru port ismini girerek çalıştırın.<br>
Daha önceden bir öğrenci MATLAB'ın eski bir sürümünde (2019a öncesi olması lazım yanlış hatırlamıyorsam) **read_angle_serial_port.m** kodunu çalıştıramadı çünkü eski sürümlerde seri port ile alakalı MATLAB fonksiyonları farklı isimlere sahip. Mesela **serialport** komutu eskiden **serial** isminde ve de diğer birçok fonksiyonun ismi farklı ve tanımları/gerçeklenmeleri farklı, çağrılmaları farklı. O ara o öğrenciye yardım etmek için bilgisayarıma üşenmedim MATLAB 2019a kurmuştum, **read_angle_serial_port_2019_a.m** isminde bir kod yazmışım, şu anda çalışıp çalışmadığından emin değilim ama aşağıda videonun olduğu sayfada sorulan bir soru üzerine **read_angle_serial_port_2019_a.m** kodunu bu sayfaya koydum, eski MATLAB sürümleriyle çalışanlar bir göz atabilirler.<br>
Doğru portu bulmak için MATLAB'ı açınca **serialportlist** komutunu kullanabilirsiniz veya Windows'da Aygıt Yöneticisi'ne gidip orada Bağlantı Noktaları (COM ve LPT) üzerine tıklayabilirsiniz.<br> 
Yukarıda **Code** yazan yeşil renkli bağlantıya tıklayarak bu sayfadaki kodları zip dosyası halinde bilgisayarınıza indirebilirsiniz.</br>
![arduino and mpu6050 connections](şekil/arduino_mpu6050_connections.png) </br></br>
![work flow](şekil/workflow.JPG) </br></br>
# Videoyu aşağıdaki bağlantıdan izleyebilirsiniz 
[![IMAGE ALT TEXT HERE](şekil/thumbnail.jpg)](https://www.youtube.com/watch?v=B2S7VlqK_-Q)</br></br>
