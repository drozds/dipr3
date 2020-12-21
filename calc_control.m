function hl = calc_control(stpt, tl, k)
    global HLv;
    global DELTA_U;
    global D;
    global ke;
    global ku;
    if(k >= 2) 
        uchyb = stpt - tl;

        sum = 0;
        for i=1:(D-1)
            sum = sum + ku(i) * DELTA_U(k-i);
        end
       display(sum);
    %     DELTA_U(k) =
        hl = HLv(k-1) +  ke * uchyb - sum;
    end
    if(k < 2)
        hl = stpt - tl;
    end
    if( hl > 100) 
        hl = 100;
    end
    if ( hl < 0 )  
        hl = 0;
    end    
end

