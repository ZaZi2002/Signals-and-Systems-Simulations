clear
clc
syms s
F = tf(conv(conv([1,3,5],[1,4,4.2]),[1,0.2,0.02]) , conv(conv([1,3,5.1],[1,2,1.2]),[1,0.2,1]));
pzmap(F);
grid on

tf2sym(F,-50:0.01:10,"Real");
title('s = Real');
grid on
tf2sym(F,-2:0.01:2,"Imag");
title('s = Imag');
grid on

F1 = ((s^2 + 3*s + 5)*(s^2 + 4*s + 4.2)*(s^2 + 0.2*s + 0.02)) / ((s^2 + 3*s + 5.01)*(s^2 + 2*s + 1.2)*(s^2 + 0.2*s + 1));
f = simplify(ilaplace(F1));
f
%%
function tf2sym(H_tf, s_intrval, s_axis) 
    % This function converts transfer function to symbolic phrase
    % and then it plots amplitude of this function for input range
    % of 's' values. 
    % If you wanna plot respect to real axis, set s_axis to "Real"
    % If you wanna plot respect to imaginary axis, set s_axis to "Imag"
    % Inputs: 
    %       H_tf: transfer function 
    %       s_interval: s values (should be real. You don't need to 
    %                   multiply s by 1j for imaginary.)
    %       s_axis: "Real" or "Imag".
    
    syms s ;
    [Num,Den] = tfdata(H_tf);
    H = poly2sym(cell2mat(Num),s)/poly2sym(cell2mat(Den),s);
    if(s_axis == "Real")
        H_subs = subs(H, s , s_intrval);
    else 
        if(s_axis == "Imag")
            H_subs = subs(H, s , 1j*s_intrval);
        else
            fprintf("Oops! your third argument should be 'Real' or 'Imag'. Try again!");
        end
    end
    
    figure(); 
    plot(s_intrval, abs(H_subs)); 
    xlabel("s values");
    ylabel("Amplitude of transfer function");
    
end