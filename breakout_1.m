%% POINTS 1, 2, 3 : Continuous/discrete + derivatives + sampling effect
clc; clear; close all;

%% -----------------------------
% Continuous representation
% -----------------------------
syms t
f_cont = sin(t);
df_cont = diff(f_cont);

t_cont = linspace(0, 2*pi, 2000);
f_cont_vals = double(subs(f_cont, t_cont));
df_cont_vals = double(subs(df_cont, t_cont));

%% -----------------------------
% Sampling frequencies to test
% -----------------------------
Fs_list = [50 20 10 5 3 2];   % decreasing sampling frequencies

for k = 1:length(Fs_list)

    Fs = Fs_list(k);
    Ts = 1/Fs;
    t_disc = 0:Ts:2*pi;
    f_disc = sin(t_disc);

    % discrete derivative
    df_disc = diff(f_disc)/Ts;
    t_disc_der = t_disc(1:end-1);

    %% -----------------------------
    % Display
    % -----------------------------
    figure('Name', ['Fs = ' num2str(Fs)], 'NumberTitle', 'off');

    subplot(2,2,1)
    plot(t_cont, f_cont_vals, 'LineWidth', 1.5)
    title(['Continuous f(t) = sin(t)'])
    xlabel('t'); ylabel('f(t)')

    subplot(2,2,2)
    stem(t_disc, f_disc, 'filled')
    title(['Discrete f[n] with Fs = ' num2str(Fs) ' Hz'])
    xlabel('n'); ylabel('f[n]')

    subplot(2,2,3)
    plot(t_cont, df_cont_vals, 'LineWidth', 1.5)
    title('Continuous derivative df/dt = cos(t)')
    xlabel('t'); ylabel('df/dt')

    subplot(2,2,4)
    stem(t_disc_der, df_disc, 'filled')
    title(['Discrete derivative with Fs = ' num2str(Fs) ' Hz'])
    xlabel('n'); ylabel('df/dt')

end
