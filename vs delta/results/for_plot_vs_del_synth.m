clear; clc; close all
FS = 24;

%% D = 20, N = 1000
D = 20; N = 1000; eps = 0.1;
load results_vs_delta_synth_D_20_N_1000_eps_0_1
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

figure(1) % for plotting loss
subplot(241)
loglog(delta_all, avg_loss_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 1e-12 1e10])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 1k, S = 5, \epsilon = 0.1)','FontSize', FS,'FontWeight','bold'); 
legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

figure(1) % for plotting errW
subplot(245)
semilogx(delta_all, avg_errW_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 1k, S = 5, \epsilon = 0.1','FontSize', FS,'FontWeight','bold'); 
legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

%% D = 20, N = 20000
D = 20; N = 20000; eps = 0.5;
load results_vs_delta_synth_D_20_N_20000_eps_0_5
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

figure(1) % for plotting loss
subplot(242)
loglog(delta_all, avg_loss_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 1e-12 1e10])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 20k, S = 5, \epsilon = 0.5','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

figure(1) % for plotting errW
subplot(246)
semilogx(delta_all, avg_errW_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 20, N = 20k, S = 5, \epsilon = 0.5','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

%% D = 50, N = 2000
D = 50; N = 2000; eps = 0.5;
load results_vs_delta_synth_D_50_N_2000_eps_0_5
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

figure(1) % for plotting loss
subplot(243)
loglog(delta_all, avg_loss_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 1e-12 1e10])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 2k, S = 5, \epsilon = 0.5','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

figure(1) % for plotting errW
subplot(247)
semilogx(delta_all, avg_errW_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 2k, S = 5, \epsilon = 0.5','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

%% D = 50, N = 20000
D = 50; N = 20000; eps = 1.0;
load results_vs_delta_synth_D_50_N_20000_eps_2
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

figure(1) % for plotting loss
subplot(244)
loglog(delta_all, avg_loss_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
loglog(delta_all, avg_loss_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 1e-12 1e10])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('Loss f_D(w)','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 20k, S = 5, \epsilon = 2.0','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')

figure(1) % for plotting errW
subplot(248)
semilogx(delta_all, avg_errW_np, 'ro-.','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_cape, 'k*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_conv, 'b*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_local, 'm*--','LineWidth',3,'MarkerSize',3); hold on
semilogx(delta_all, avg_errW_exst, 'rsq--','LineWidth',3,'MarkerSize',3); hold on
set(gca,'FontSize',FS,'FontWeight','bold')
axis([delta_all(1)/10 delta_all(end)*10 -0.01 0.25])
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('err_w','FontSize',FS,'FontWeight','bold');
title('Synth (D = 50, N = 20k, S = 5, \epsilon = 2.0','FontSize', FS,'FontWeight','bold'); 
% legend('Non-priv', 'capeFM', 'conv', 'local', 'dp-fm', 'Location','best')