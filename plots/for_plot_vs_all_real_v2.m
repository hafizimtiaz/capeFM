clear; clc; close all
FS = 20;

%% crime data vs epsilon
% N = 800
load results_vs_epsilon_crime_D_101_N_800
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

load OP_results_vs_epsilon_crime_D_101_N_800
avg_loss_op = abs(mean(loss_opt_op));

subplot(161)
loglog(epsilon_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 1e-7 1e14])
xlabel('(a) Privacy parameter (\epsilon)','FontSize',FS+12,'FontWeight','bold');
ylabel('Loss f_D(w)','FontSize',FS+12,'FontWeight','bold');
title('Crime (D = 101, N = 800)','FontSize', FS+12,'FontWeight','bold'); 
legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'objPert', 'Location','NE')


%% Twitter data vs epsilon

% N = 20000
load results_vs_epsilon_twitter_D_77_N_20000
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

load OP_results_vs_epsilon_twitter_D_77_N_20000
avg_loss_op = abs(mean(loss_opt_op));

subplot(162)
loglog(epsilon_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 1e-6 1e10])
xlabel('(b) Privacy parameter (\epsilon)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Twitter (D = 77, N = 20k)','FontSize', FS+12,'FontWeight','bold'); 

%% crime data vs samples
% eps = 0.2
load results_vs_samples_crime_D_101_eps_0_2
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

load OP_results_vs_samples_crime_D_101_eps_0_2
avg_loss_op = abs(mean(loss_opt_op));

subplot(163)
loglog(N_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/2 N_all(end)*2 1e-6 1e10])
xlabel('(c) Total samples (N)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Crime (D = 101, \epsilon = 0.2)','FontSize', FS+12,'FontWeight','bold'); 
xticks([400 1000 1600])
xticklabels({'0.4k', '1k', '1.6k'})


%% twitter data vs samples

% eps = 1.0
load results_vs_samples_twitter_D_77_eps_1
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

load OP_results_vs_samples_twitter_D_77_eps_1
avg_loss_op = abs(mean(loss_opt_op));

subplot(164)
loglog(N_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 1e-6 1e10])
xlabel('(d) Total samples (N)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Twitter (D = 77, \epsilon = 1.0)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1000 5000 20000])
xticklabels({'1k', '5k', '20k'})

%% crime data vs delta
% N = 800
load results_vs_delta_crime_D_101_N_800
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

load OP_results_vs_delta_crime_D_101_N_800
avg_loss_op = abs(mean(loss_opt_op));

subplot(165)
eff_delta_all = calculateDelta(0.5, delta_all, 5, 800);
loglog(eff_delta_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 1e-7 1e14])
xlabel('(e) Privacy parameter (\delta)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Crime (D = 101, N = 800, \epsilon = 0.5)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1e-4 1e-3 1e-2])
xticklabels({'10^{-4}', '10^{-3}', '10^{-2}'})


%% Twitter data vs delta

% N = 20000
load results_vs_delta_twitter_D_77_N_20000
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

load OP_results_vs_delta_twitter_D_77_N_20000
avg_loss_op = abs(mean(loss_opt_op));

subplot(166)
eff_delta_all = calculateDelta(2.0, delta_all, 5, 20e3);
loglog(eff_delta_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 1e-6 1e10])
xlabel('(f) Privacy parameter (\delta)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Twitter (D = 77, N = 20k, \epsilon = 2.0)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1e-4 1e-3 1e-2])
xticklabels({'10^{-4}', '10^{-3}', '10^{-2}'})