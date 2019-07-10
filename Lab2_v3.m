%define input bit sequence
x = randi([0 1],1,10)

%i-Polar NRZ
    %bit mapping
    xInVolt = [];
    for i = 1:length(x)
        if x(i) == 1
            xInVolt(i) = 3;
        else
            xInVolt(i) = -3;
        end
    end
    %pulse shaping
    i = 1;
    t = 0:0.01:length(xInVolt);
    y = t;
    for j = 1:length(t)
        if t(j)<=i;
            y(j) = xInVolt(i);
        else
            y(j) = xInVolt(i);
            i = i+1;
        end
    end
    %plotting
    subplot(6,2,1);
    plot(t,y);
    title('Polar NRZ')
    axis([0 length(xInVolt) -5 5]);
    %PSD
    psd = abs( fft(y, length(y))).*2/(length(y));
    subplot(6,2,2);
    plot(psd)
    
%ii-Bipolar RZ
    %bit mapping
    xInVolt = [];
    f = 1;
    for i = 1:length(x)
        if x(i) == 1;
            if f == 1;
                xInVolt(i) = 3;
                f = 0;
            elseif f == 0;
                xInVolt(i) = -3;
                f = 1;
            end
        else
            if i>1;
                xInVolt(i) = xInVolt(i-1);
            end
        end        
    end
    %pulse shaping
    i = 1;    
    t = 0:0.01:length(xInVolt);
    for j = 1:length(t)
        if t(j)<=i;
            y(j) = xInVolt(i);
        else
            y(j) = xInVolt(i);
            i = i+1;
        end
    end
    %plotting
    subplot(6,2,3);
    plot(t,y);
    title('Bipolar RZ');
    axis([0 length(xInVolt) -5 5]);
    %PSD
    psd = abs( fft(y, length(y))).*2/(length(y));
    subplot(6,2,4);
    plot(psd)
    
%iii-Polar RZ
    %bit mapping
    xInVolt = [];
    for i = 1:length(x)
        if x(i) == 1
            xInVolt(i) = 3;
        else
            xInVolt(i) = -3;
        end
    end
    %pulse shaping
    i = 1;
    a = 0;
    b = 0.5;    
    t = 0:0.01:length(xInVolt);
    for j = 1:length(t)
        if t(j)>=a && t(j)<=b;
            y(j) = xInVolt(i);
        elseif t(j)>b && t(j)<i;
            y(j) = 0;
        else
            i = i+1;
            a = a+1;
            b = b+1;
            y(j) = y(j-1);
        end
    end
    %plotting
    subplot(6,2,5);
    plot(t,y);
    title('Polar RZ');
    axis([0 length(xInVolt) -5 5]);
    %PSD
    psd = abs( fft(y, length(y))).*2/(length(y));
    subplot(6,2,6);
    plot(psd);
    
%iv-Alternative mark inversion
    %bit mapping
    xInVolt = [];
    f = 1;
    for i = 1:length(x)
        if x(i) == 1;
            if f == 1;
                xInVolt(i) = 3;
                f = -1;
            else 
                xInVolt(i) = -3;
                f = 1;
            end
        else
            if i>0;
                xInVolt(i) = 0;
            end
        end        
    end
    %pulse shaping
    i = 1;
    t = 0:0.01:length(xInVolt);
    for j = 1:length(t)
        if t(j)<=i;
            y(j) = xInVolt(i);
        else
            y(j) = xInVolt(i);
            i = i+1;
        end
    end
    %plotting
    subplot(6,2,7);
    plot(t,y);
    title('Alternative mark inversion');
    axis([0 length(xInVolt) -5 5]);
    %PSD
    psd = abs( fft(y, length(y))).*2/(length(y));
    subplot(6,2,8);
    plot(psd);

%v-Manchester
    %bit mapping
    xInVolt = [];
    for i = 1:length(x)
        if x(i) == 1
            xInVolt(i) = 3;
        else
            xInVolt(i) = -3;
        end
    end
    %pulse shaping
    i = 1;
    a = 0;
    b = 0.5;    
    t = 0:0.01:length(xInVolt);
    for j = 1:length(t)
        if t(j)>=a && t(j)<=b;
            y(j) = xInVolt(i);
        elseif t(j)>b && t(j)<i;
            y(j) = -xInVolt(i);
        else
            i = i+1;
            a = a+1;
            b = b+1;
            y(j) = y(j-1);
        end
    end
    %plotting
    subplot(6,2,9);
    plot(t,y);
    title('Manchester');
    axis([0 length(xInVolt) -5 5]);
    %PSD
    psd = abs( fft(y, length(y))).*2/(length(y));
    subplot(6,2,10);
    plot(psd);
    
%vi-Multi-level transmission
    %bit mapping
    xInVolt = [];
    f = 2;
    for i = 1:length(x)
        if x(i) == 1;
            if f == 2;
                xInVolt(i) = 3;
                f = 1;
            elseif f == 1;
                xInVolt(i) = 0;
                f = 0;
            else
                xInVolt(i) = -3;
                f = 2;
            end
        else
            if i>1;
                xInVolt(i) = xInVolt(i-1);
            end
        end        
    end
    %pulse shaping
    i = 1;    
    t = 0:0.01:length(xInVolt);
    for j = 1:length(t)
        if t(j)<=i;
            y(j) = xInVolt(i);
        else
            y(j) = xInVolt(i);
            i = i+1;
        end
    end
    %plotting
    subplot(6,2,11);
    plot(t,y);
    title('Multi-level transmission');
    axis([0 length(xInVolt) -5 5]);
    %PSD
    psd = abs( fft(y, length(y))).*2/(length(y));
    subplot(6,2,12);
    plot(psd);
    
