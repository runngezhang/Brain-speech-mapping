% load trig information
% TimePoints = 5125000
clear
load('trgi_data')

t0 = 5125000;

fid = fopen('s1498_4blocks_NEW_TEST.mul','rb');
g   = 0;
c   = -2;
k   = 1;
bs = 500;
n_trials = 80;
n_time = 400 + bs;
n_cond = 13;

for i=1:n_cond,
    
   trials(i).epoch = zeros(n_trials,n_time,2);
      trials(i).i_trials = 0;
end

code_list = [];
tp = 0;
tp2 = 0;

while (1)
    
    s = fgetl(fid);
    if ~ischar(s) break; end
    
    if s ~= -1
         %disp(s)
        c = c +1;
    end
    
    if (c == round(time_info(k)./1e3) - bs + tp2)
        ptr1 = '[^\s][\s]+[^\s]+';
        ptr2 = '[\s][^\s]+';
        sp_pos1 = regexp(s ,ptr1);
        sp_pos2 = regexp(s ,ptr2);
        sp_pos3 = sp_pos2(end);
        c1 = str2num(s(1:sp_pos1));
        c2 = str2num(s(sp_pos3+1:end));
        i_trials = trials(trig_code(k)).i_trials + 1;
        trials(trig_code(k)).i_trials = i_trials;
        if tp > n_time
            k = k +1;
            disp(k)
            tp = 0;
            tp2 = 0;
            continue;
        else
            tp = tp + 1;
            tp2 = tp2 + 5;
        end
        trials(trig_code(k)).epoch(i_trials,tp,:) = [c1 c2];
        
    end
    %pause;
    
   %c
end

