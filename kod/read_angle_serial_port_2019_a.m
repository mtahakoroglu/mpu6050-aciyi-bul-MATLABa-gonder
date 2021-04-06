clear all; close all; clc;
s = serial('COM4', 'BaudRate', 57600); % doğru port numarasını girmek size kalmış
fopen(s);
stopTime = 20; windowSize = 10; % birimi saniye, ilk parametre kaç saniye okuyacağınız, ikincisi ekranda görme penceresinin zaman genişliği
realTimeGraph = false; realTimeDisplay = true; % burdaki boolean değişkenleri true-false yaparak gerçek-zamanda grafik ve konsola basmayı sağlayabilirsiniz

if (realTimeGraph)
    figure(1); clf;
    grid on; ax = gca; ax.GridLineStyle = '--';
    xlabel('time (s)'); ylabel('angle (degree)');
    hold on;
end

downSamplingRate = 10; sampleNumber = 0; % eğer bilgisayarnız iyi değilse ve gerçek-zamanda grafik çizdiriyorsanız o zaman ilk parametreyi daha yüksek bir değer yapın
t = 0; angle = 0; i = 0;
while ( t < stopTime )
    if (sampleNumber == downSamplingRate)
        sampleNumber = 0;
    end
    if ( fread(s, 1, 'uint8') == 'h' )
        i = i + 1; % paket alýnýyor
        angle = fread(s, 1, 'single');
        t = fread(s, 1, 'uint32') / 1000;
        timeCapture(i) = t; angleCapture(i) = angle;
    end
    if ( realTimeDisplay )
            fprintf('Time = %.3fs    Pitch angle = %.2f.\n', t, angle);
    end
    if ( realTimeGraph && sampleNumber == 0 ) % plot the downsampled angle variable
        plot(t, angle, 'k.');
        tempBounds = floor(t/windowSize);
        axis([tempBounds*windowSize, (tempBounds+1)*windowSize, -360, 360])
        text = sprintf('Pitch angle is %.2f at time = %.3f', angle, t);
        title(text);
    end
    sampleNumber = sampleNumber+1;
end
fclose(s); delete(s); clear s;
%% açı yakalama işlemi bitince yakalanmış bütün verileri çizdir
figure(2);
plot(timeCapture, angleCapture, 'r-');
grid on; ax = gca; ax.GridLineStyle = '--';
xlabel('time (s)'); ylabel('angle (degree)');
title('zaman vs. aci');
