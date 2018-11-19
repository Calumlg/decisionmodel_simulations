%% CALUM's Matlab Mini Task #1
% The following script takes values of Value gain and value loss to
% determine the utility of a gamble gain and the utility of a certain
% reward. These values are then used to determine the probability of taking
% a gamble iterating through a series of alpha gain (risk aversion) values.

%% Assigning gamble gain and loss values

n_gambles = 6;
VGambleGain = [40,40,30,20,30,10];
VGambleLoss = repelem(0, n_gambles);
VCertainGain = [20,20,20,-10,-20,-15];
Util_Cert1 = NaN(3,6)
Util_Cert2 = NaN(3,6)
aGain = [0.8:0.1:1.4];
UtilityDifference = NaN(n_gambles, length(aGain));
mu = -1;
LossAversion = [0.1:0.1:0.8];
%% Calculating UGamble and UCertain values
% This is done with a for loop where each gamble value is multiplied by 0.5
% and multipled element wise to the power aGain (0.8:.01:1.3)

for GenericCount    = 1 : length(VGambleGain)
for A_GAIN_Count    = 1 : length(aGain)
for L_AV_Count      = 1 : length(LossAversion)
    
        V_CERT_GAIN                             = VCertainGain(GenericCount);
        V_GAM_GAIN                              = VGambleGain(GenericCount);
        A_GAIN                                  = aGain(A_GAIN_Count)
        L_AV                                    = LossAversion(L_AV_Count)
        
        EV                                      = V_GAM_GAIN*0.5
        Util_Gam(GenericCount, A_GAIN_Count)    = EV^A_GAIN
        
if     V_CERT_GAIN >= 0
            Util_Cert1(1,1,:)                    = V_CERT_GAIN^A_GAIN
else   V_CERT_GAIN < 0
            Util_Cert2(1,1,:)                    = -L_AV_Count*(V_CERT_GAIN^A_GAIN)
        Util_Cert(GenericCount, A_GAIN_Count)    = vertcat(Util_Cert1,Util_Cert2)
end

      
        
       
end        
end     
end

clear A_GAIN_Count
clear LV_Count
clear GenericCount
%% Probability of choosing a gamble
% Here we are coding to generate the probability a given gamble will be
% chosen, using the utility values above.

UtilityDifference = (Util_Gam-Util_Cert);

pGamble = 1./(1+exp(mu.*(UtilityDifference)));

%% Graphing the relation between different values of aGain and pGamble

figure;
for A_GAIN_Count    = 1 : length(aGain);
        % subplot(2,4,A_GAIN_Count)
            plot(pGamble(:, A_GAIN_Count),Util_Gam(:,A_GAIN_Count)); hold on
           % 'Color''[0.2,0.6,0.4]';
            xlabel('Utility Gamble')
            ylabel('Values of p')
            
end

%% To do next:
    % - Add the loss aversion factor (lambda)
    % - After adding lamda, consider whether to loop values of lamda and a gain
    %   or keep a gain constant
    % - Consider making Util_Gam a cell and run through each value of a gain and
    %   lambda 
    % - Make a vector of the 'Objective Utility of the Difference' - which is
    %   just Util_Gam without the a gain weighting (or the power of 1)
    % - Plot Obj Util by values of pGamble - BEAUTIFULLY DONE (sensible axis for
    %   probability, squared axis), don't want numerical value next to every tick
    %   of Y axis


%% Thoughts...

% Efficiency - For the gain gambles, given that the 0s in gamble loss
% effectively negate the second half of the equation, there was probably a
% more elegant and/or efficient way of representing it (maybe with NaN?)
%RB - true, but you want the code to be flexible so you could use it to
%generate values in the loss frame as well, so best to include it.

% Variable names - In hindsight I would have chosen more concise variable names not sure why
% I abbreviated value to V but wrote the other words out in full...
%RB - you are right, try and be consistent. Everyone names variables
%differently, so you can spend a bit of time coming up with your own
%'grammar'.

% Flexibility - given what you said about being able to remove entire rows
% from Data Structures, it isn't as flexible as it could be. But the risk
% taking values and the increments could be easily changed if needed and
% aside from the 0.5 and 1s, there is nothing hard coded beyond the first
% few variables which should make it reasonably flexible.
%RB - flexibility is good, you made the structure based on the function, so
%good job!

    
