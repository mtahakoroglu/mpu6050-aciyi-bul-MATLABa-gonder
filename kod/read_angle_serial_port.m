clear all; clc;

s = serialport('COM9', 57600);
flush(s);
t = 0; stopTime = 20; % seconds

realTimeGraph = true;
realTimeDisplay = false;

if (realTimeGraph)
figure(1); clf;
grid on;
xlabel('time (s)'); ylabel('angle (degree)');
axis([0 stopTime -360 360])
hold on; 
end

downSamplingRate = 10; x = 0; % for real-time plotting
while ( t < stopTime )
    if (x == downSamplingRate)
        x = 0;
    end
    if ( read(s, 1, 'uint8') == 'h' )
        angle = read(s, 1, 'single');
        if (read(s,1,'uint8') == '-')
            t = read(s, 1, 'uint32') / 1000;
        end
        if ( realTimeDisplay )
        fprintf('Number of bytes available = %i    Time = %.3fs    Pitch angle = %.2f.\n', ...
            s.NumBytesAvailable, t, angle);
        end
    end
    if ( realTimeGraph && x == 0 )
        plot(t, angle, 'k.');
        text = sprintf('Pitch angle is %.2f at time = %.3f', angle, t);
        title(text);
    end
    x = x+1;
end
delete(s);
pause();
close(figure(1));