clear; clc; close all
FS = 20;

%% vs epsilon
% D = 20, N = 1000
D = 20; N = 1000;
load results_vs_epsilon_synth_D_20_N_5000
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_epsilon_synth_D_20_N_5000
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);

figure(1) % for plotting loss
subplot(161)
loglog(epsilon_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 1e-12 1e10])
xlabel('(a) Privacy parameter (\epsilon)','FontSize',FS+12,'FontWeight','bold');
ylabel('Loss f_D(w)','FontSize',FS+12,'FontWeight','bold');
title('Synth (D = 20, N = 5k)','FontSize', FS+12,'FontWeight','bold'); 
legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'objPert', 'Location','NE')

figure(2) % for plotting errW
subplot(341)
semilogx(epsilon_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 5k)','FontSize', FS,'FontWeight','bold'); 
legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'objPert', 'Location','NE')

% D = 20, N = 20000
D = 20; N = 20000;
load results_vs_epsilon_synth_D_20_N_20000
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_epsilon_synth_D_20_N_20000
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);

figure(2) % for plotting errW
subplot(342)
semilogx(epsilon_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 20k)','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

% D = 50, N = 5000
D = 50; N = 1000;
load results_vs_epsilon_synth_D_50_N_5000
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_epsilon_synth_D_50_N_5000
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);


figure(2) % for plotting errW
subplot(343)
semilogx(epsilon_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 5k)','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

% D = 50, N = 20000
D = 50; N = 20000;
load results_vs_epsilon_synth_D_50_N_20000
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_epsilon_synth_D_50_N_20000
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);

figure(1) % for plotting loss
subplot(162)
loglog(epsilon_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(epsilon_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 1e-12 1e10])
xlabel('(b) Privacy parameter (\epsilon)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 20k)','FontSize', FS+12,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

figure(2) % for plotting errW
subplot(344)
semilogx(epsilon_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 20k)','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

%% vs samples
% D = 20, eps = 0.1
load results_vs_samples_synth_D_20_eps_0_5
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_samples_synth_D_20_eps_0_5
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);

figure(1) % for plotting loss
subplot(163)
loglog(N_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on


set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 1e-12 1e10])
xlabel('(c) Total samples (N)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, \epsilon = 0.5)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1e3 5e3 20e3])
xticklabels({'1k', '5k', '20k'})

figure(2) % for plotting errW
subplot(345)
semilogx(N_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 -0.01 0.25])
xlabel('Total samples (N)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, \epsilon = 0.5)','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'objPert', 'Location','best')
xticks([1e3 5e3 20e3])
xticklabels({'1k', '5k', '20k'})

% D = 20, eps = 0.5
load results_vs_samples_synth_D_20_eps_1
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_samples_synth_D_20_eps_1
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);

figure(2) % for plotting errW
subplot(346)
semilogx(N_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 -0.01 0.25])
xlabel('Total samples (N)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, \epsilon = 1.0)','FontSize', FS,'FontWeight','bold'); 
xticks([1e3 5e3 20e3])
xticklabels({'1k', '5k', '20k'})

% D = 50, eps = 0.2
load results_vs_samples_synth_D_50_eps_0_5
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_samples_synth_D_50_eps_0_5
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);


figure(2) % for plotting errW
subplot(347)
semilogx(N_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 -0.01 0.25])
xlabel('Total samples (N)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, \epsilon = 0.5)','FontSize', FS,'FontWeight','bold'); 
xticks([1e3 5e3 20e3])
xticklabels({'1k', '5k', '20k'})

% D = 50, eps = 1
load results_vs_samples_synth_D_50_eps_1
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = abs(mean(loss_opt_exst));

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(errW_exst);

load OP_results_vs_samples_synth_D_50_eps_1
avg_loss_op = abs(mean(loss_opt_op));
avg_errW_op = mean(errW_op);

figure(1) % for plotting loss
subplot(164)
loglog(N_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(N_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 1e-12 1e10])
xlabel('(d) Total samples (N)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, \epsilon = 1.0)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1e3 5e3 20e3])
xticklabels({'1k', '5k', '20k'})

figure(2) % for plotting errW
subplot(348)
semilogx(N_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([N_all(1)/10 N_all(end)*10 -0.01 0.25])
xlabel('Total samples (N)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, \epsilon = 1.0)','FontSize', FS,'FontWeight','bold'); 
xticks([1e3 5e3 20e3])
xticklabels({'1k', '5k', '20k'})

%% vs delta
% D = 20, N = 1000
D = 20; N = 1000; eps = 0.1;
load results_vs_delta_synth_D_20_N_5000_eps_0_5
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = mean(abs(mean(loss_opt_exst))) * ones(length(delta_all),1);

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(abs(mean(errW_exst))) * ones(length(delta_all),1);

load OP_results_vs_delta_synth_D_20_N_5000_eps_0_5
avg_loss_op = mean(abs(mean(loss_opt_op)));
avg_loss_op = avg_loss_op * ones(length(delta_all),1);
avg_errW_op = mean(errW_op);

figure(1) % for plotting loss
subplot(165)
eff_delta_all = calculateDelta(0.5, delta_all, 5, 5e3);
loglog(eff_delta_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on


set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 1e-12 1e6])
xlabel('(e) Privacy parameter (\delta)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 5k, \epsilon = 0.5)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1e-5 1e-3 1e-1])
xticklabels({'10^{-5}', '10^{-3}', '10^{-1}'})

figure(2) % for plotting errW
subplot(349)
semilogx(eff_delta_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on

set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 5k, \epsilon = 0.5)','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'objPert', 'Location','best')
xticks([1e-5 1e-3 1e-1])
xticklabels({'10^{-5}', '10^{-3}', '10^{-1}'})

% D = 20, N = 20000
D = 20; N = 20000; eps = 0.5;
load results_vs_delta_synth_D_20_N_20000_eps_1
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = mean(abs(mean(loss_opt_exst))) * ones(length(delta_all),1);

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(abs(mean(errW_exst))) * ones(length(delta_all),1);

load OP_results_vs_delta_synth_D_20_N_20000_eps_1
avg_loss_op = mean(abs(mean(loss_opt_op)));
avg_loss_op = avg_loss_op * ones(length(delta_all),1);
avg_errW_op = mean(errW_op);


figure(2) % for plotting errW
subplot(3,4,10)
semilogx(eff_delta_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 20k, \epsilon = 1.0)','FontSize', FS,'FontWeight','bold'); 
xticks([1e-5 1e-3 1e-1])
xticklabels({'10^{-5}', '10^{-3}', '10^{-1}'})

% D = 50, N = 2000
D = 50; N = 2000; eps = 0.5;
load results_vs_delta_synth_D_50_N_5000_eps_0_5
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = mean(abs(mean(loss_opt_exst))) * ones(length(delta_all),1);

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(abs(mean(errW_exst))) * ones(length(delta_all),1);

load OP_results_vs_delta_synth_D_50_N_5000_eps_0_5
avg_loss_op = mean(abs(mean(loss_opt_op)));
avg_loss_op = avg_loss_op * ones(length(delta_all),1);
avg_errW_op = mean(errW_op);


figure(2) % for plotting errW
subplot(3,4,11)
semilogx(eff_delta_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 5k, \epsilon = 0.5)','FontSize', FS,'FontWeight','bold'); 
xticks([1e-5 1e-3 1e-1])
xticklabels({'10^{-5}', '10^{-3}', '10^{-1}'})

% D = 50, N = 20000
D = 50; N = 20000; eps = 1.0;
load results_vs_delta_synth_D_50_N_20000_eps_2
avg_loss_np = abs(mean(loss_opt_np));
avg_loss_cape = abs(mean(loss_opt_cape));
avg_loss_conv = abs(mean(loss_opt_conv));
avg_loss_local = abs(mean(loss_opt_local));
avg_loss_exst = mean(abs(mean(loss_opt_exst))) * ones(length(delta_all),1);

avg_errW_np = mean(errW_np);
avg_errW_cape = mean(errW_cape);
avg_errW_conv = mean(errW_conv);
avg_errW_local = mean(errW_local);
avg_errW_exst = mean(abs(mean(errW_exst))) * ones(length(delta_all),1);

load OP_results_vs_delta_synth_D_50_N_20000_eps_2
avg_loss_op = mean(abs(mean(loss_opt_op)));
avg_loss_op = avg_loss_op * ones(length(delta_all),1);
avg_errW_op = mean(errW_op);

figure(1) % for plotting loss
subplot(166)
eff_delta_all = calculateDelta(2.0, delta_all, 5, 20e3);
loglog(eff_delta_all, avg_loss_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
loglog(eff_delta_all, avg_loss_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 1e-12 1e6])
xlabel('(f) Privacy parameter (\delta)','FontSize',FS+12,'FontWeight','bold');
% ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 20k, \epsilon = 2.0)','FontSize', FS+12,'FontWeight','bold'); 
xticks([1e-5 1e-3 1e-1])
xticklabels({'10^{-5}', '10^{-3}', '10^{-1}'})

figure(2) % for plotting errW
subplot(3,4,12)
semilogx(eff_delta_all, avg_errW_np, 'r^-.','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_cape, 'kh--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_conv, 'bx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_local, 'm.--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_exst, 'r+--','LineWidth',3,'MarkerSize',10); hold on
semilogx(eff_delta_all, avg_errW_op, 'rp-','LineWidth',3,'MarkerSize',10); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([eff_delta_all(1)/10 eff_delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 20k, \epsilon = 2.0)','FontSize', FS,'FontWeight','bold'); 
xticks([1e-5 1e-3 1e-1])
xticklabels({'10^{-5}', '10^{-3}', '10^{-1}'})