% TRELLIS FOR THE PREDICTIVE VITERBI ALGORITHM (PREDICTION ORDER IS 1)

function [Prev_State,Prev_State_trans,Prev_Ip,Outputs_prev]= Get_Trellis()
Prev_State = [1,2,3,4;1,2,3,4;1,2,3,4;1,2,3,4]; % PREVIOUS STATES
Prev_State_trans = [1,1,1,1;2,2,2,2;3,3,3,3;4,4,4,4]; % TRANSPOSE OF P_State
Prev_Ip = [1,1,1,1;2,2,2,2;3,3,3,3;4,4,4,4]; % PREVIOUS INPUTS
Outputs_prev = [1,5,9,13;2,6,10,14;3,7,11,15;4,8,12,16];% GAMMA INDICES FOR THE ALPHA RECURSION (THINK OF BCJR ALGORITHM)
end