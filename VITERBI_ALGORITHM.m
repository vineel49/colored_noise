% Viterbi Algorithm - Soft Input, Hard Output 
% Written by Vineel Kumar Veludandi
function[DEC_SYM]=VITERBI_ALGORITHM(NUM_SYM,DECODING_DELAY,BRANCH_METRIC)
[P_State,P_State_trans,P_IP,Ga_Inx]= Get_Trellis();
NUM_STATES = 4;  % NUMBER OF STATES IN THE TRELLIS
% General Initialization
IP = 0; % input initialization
DEC_SYM = zeros(1,NUM_SYM-DECODING_DELAY); % decoded symbols (-decoding delay is because,ignoring last transient part)
SURVIVOR_NODE = zeros(NUM_STATES,NUM_SYM); % survivor nodes
SURVIVOR_IP = zeros(NUM_STATES,NUM_SYM); % survivor inputs
PATH_METRIC = zeros(NUM_STATES,NUM_SYM+1); % path metrics
index_temp = [0;1*4;2*4;3*4]; %for linear indexing.
for SYM_CNT =  1:NUM_SYM  
   [PATH_METRIC(:,SYM_CNT+1),index] = min([PATH_METRIC(P_State(:,1),SYM_CNT)+ BRANCH_METRIC(Ga_Inx(:,1),SYM_CNT) ...
       PATH_METRIC(P_State(:,2),SYM_CNT)+ BRANCH_METRIC(Ga_Inx(:,2),SYM_CNT) ...
       PATH_METRIC(P_State(:,3),SYM_CNT)+ BRANCH_METRIC(Ga_Inx(:,3),SYM_CNT) ...
       PATH_METRIC(P_State(:,4),SYM_CNT)+ BRANCH_METRIC(Ga_Inx(:,4),SYM_CNT)],[],2);
   SURVIVOR_NODE(:,SYM_CNT) = P_State_trans(index+index_temp);
   SURVIVOR_IP(:,SYM_CNT) = P_IP(index+index_temp); 
   %      Back tracing  
if (SYM_CNT>DECODING_DELAY) 
[~,trace_bf] = min(PATH_METRIC(:,SYM_CNT+1));
for bk_cnt= 1 : DECODING_DELAY
IP = SURVIVOR_IP(trace_bf,SYM_CNT+1-bk_cnt);
trace_bf = SURVIVOR_NODE(trace_bf,SYM_CNT+1-bk_cnt);    
end
DEC_SYM(SYM_CNT-DECODING_DELAY)=IP;
end % for if statement
end % for forward recursiion

end 