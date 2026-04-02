warning off;close all;clear;clc  

load('B0005.mat');
capacity_B5 = [];

for i = 1:length(B0005.cycle)
    if strcmp(B0005.cycle(i).type,'discharge')                                  
        capacity_B5 = [capacity_B5, B0005.cycle(i).data.Capacity];             
    end
end

charge_cycles = B0005.cycle(strcmp({B0005.cycle.type}, 'charge'));
discharge_cycles = B0005.cycle(strcmp({B0005.cycle.type}, 'discharge'));
num_cycles = numel(charge_cycles);

%%
% charging voltage curve
if num_cycles >= 33  
    keep_indices = true(1, num_cycles);  
    keep_indices([1, 33]) = false;     
    charge_cycles1 = charge_cycles(keep_indices);  
end

keep_indices = true(1, numel(charge_cycles1));
for i = 1:numel(charge_cycles1)
    voltage_data = charge_cycles1(i).data.Voltage_measured;
    if any(voltage_data > 4.5)
        keep_indices(i) = false;
    end
end

figure;
plot(charge_cycles(10).data.Time, charge_cycles(10).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(10)]);
hold on;
plot(charge_cycles(40).data.Time, charge_cycles(40).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(40)]);
hold on;
plot(charge_cycles(70).data.Time, charge_cycles(70).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(70)]);
hold on;
plot(charge_cycles(100).data.Time, charge_cycles(100).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(100)]);
hold on;
plot(charge_cycles(130).data.Time, charge_cycles(130).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(130)]);
hold on;
plot(charge_cycles(160).data.Time, charge_cycles(160).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(160)]);
hold on;

xlabel('Time (s)');
ylabel('Voltage (V)');
axis([0, 8000, 3.2, 4.3]);
box on;
legend('Location', 'best');
legend boxoff;hold off;

%%
% charging current curve
figure;
plot(charge_cycles(10).data.Time, charge_cycles(10).data.Current_charge, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(10)]);
hold on;
plot(charge_cycles(40).data.Time, charge_cycles(40).data.Current_charge, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(40)]);
hold on;
plot(charge_cycles(70).data.Time, charge_cycles(70).data.Current_charge, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(70)]);
hold on;
plot(charge_cycles(100).data.Time, charge_cycles(100).data.Current_charge, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(100)]);
hold on;
plot(charge_cycles(130).data.Time, charge_cycles(130).data.Current_charge, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(130)]);
hold on;
plot(charge_cycles(160).data.Time, charge_cycles(160).data.Current_charge, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(160)]);
hold on;

xlabel('Time (s)');
ylabel('Current (A)');
axis([0, 8000, -0.5, 1.8]);
box on;
legend('Location', 'best');
legend boxoff;hold off;

%%
% charging temperature curve
figure;
plot(charge_cycles(10).data.Time, charge_cycles(10).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(10)]);
hold on;
plot(charge_cycles(40).data.Time, charge_cycles(40).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(40)]);
hold on;
plot(charge_cycles(70).data.Time, charge_cycles(70).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(70)]);
hold on;
plot(charge_cycles(100).data.Time, charge_cycles(100).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(100)]);
hold on;
plot(charge_cycles(130).data.Time, charge_cycles(130).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(130)]);
hold on;
plot(charge_cycles(160).data.Time, charge_cycles(160).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(160)]);
hold on;

xlabel('Time (s)');
ylabel('Temperature (℃)');
legend('Location', 'best');
legend boxoff;hold off;

%%
% discharging voltage curve
figure;
plot(discharge_cycles(10).data.Time, discharge_cycles(10).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(10)]);
hold on;
plot(discharge_cycles(40).data.Time, discharge_cycles(40).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(40)]);
hold on;
plot(discharge_cycles(70).data.Time, discharge_cycles(70).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(70)]);
hold on;
plot(discharge_cycles(100).data.Time, discharge_cycles(100).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(100)]);
hold on;
plot(discharge_cycles(130).data.Time, discharge_cycles(130).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(130)]);
hold on;
plot(discharge_cycles(160).data.Time, discharge_cycles(160).data.Voltage_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(160)]);
hold on;

xlabel('Time (s)');
ylabel('Voltage (V)');
box on;
ylim([2.5, 4.4]);
legend('Location', 'northeast');
legend boxoff;hold off;

%%
% discharging current curve
figure;
plot(discharge_cycles(10).data.Time, discharge_cycles(10).data.Current_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(10)]);
hold on;
plot(discharge_cycles(40).data.Time, discharge_cycles(40).data.Current_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(40)]);
hold on;
plot(discharge_cycles(70).data.Time, discharge_cycles(70).data.Current_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(70)]);
hold on;
plot(discharge_cycles(100).data.Time, discharge_cycles(100).data.Current_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(100)]);
hold on;
plot(discharge_cycles(130).data.Time, discharge_cycles(130).data.Current_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(130)]);
hold on;
plot(discharge_cycles(160).data.Time, discharge_cycles(160).data.Current_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(160)]);
hold on;

xlabel('Time (s)');
ylabel('Current (A)');
legend('Location', 'northwest');
legend boxoff;hold off;

%%
% discharging temperature curve
figure;
plot(discharge_cycles(10).data.Time, discharge_cycles(10).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(10)]);
hold on;
plot(discharge_cycles(40).data.Time, discharge_cycles(40).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(40)]);
hold on;
plot(discharge_cycles(70).data.Time, discharge_cycles(70).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(70)]);
hold on;
plot(discharge_cycles(100).data.Time, discharge_cycles(100).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(100)]);
hold on;
plot(discharge_cycles(130).data.Time, discharge_cycles(130).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(130)]);
hold on;
plot(discharge_cycles(160).data.Time, discharge_cycles(160).data.Temperature_measured, 'LineWidth', 3, 'DisplayName', ['Cycle ' num2str(160)]);
hold on;

xlabel('Time (s)');
ylabel('Temperature(℃)');
box on;
legend('Location', 'best');
legend boxoff;hold off;

%%
% voltage & current profile
charge_cycle2 = charge_cycles(2);
charge_cycle150 = charge_cycles(150);
discharge_cycle2 = discharge_cycles(2);
discharge_cycle150 = discharge_cycles(150);
charge_cycle2_end_time = max(charge_cycle2.data.Time);
charge_cycle150_end_time = max(charge_cycle150.data.Time);

figure;
yyaxis left;
h1 = plot(charge_cycle2.data.Time, charge_cycle2.data.Voltage_measured, 'b-', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle2.data.Time + charge_cycle2_end_time, discharge_cycle2.data.Voltage_measured, 'b-', 'LineWidth', 2.5);
hold on;
h2 = plot(charge_cycle150.data.Time, charge_cycle150.data.Voltage_measured, 'b--', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle150.data.Time + charge_cycle150_end_time, discharge_cycle150.data.Voltage_measured, 'b--', 'LineWidth', 2.5);
hold on;
ylabel('Voltage (V)');
ylim([2.5, 4.5]);
yticks(linspace(2.5, 4.5, 9));

yyaxis right;
h3 = plot(charge_cycle2.data.Time, charge_cycle2.data.Current_charge, 'r-', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle2.data.Time + charge_cycle2_end_time, discharge_cycle2.data.Current_measured, 'r-', 'LineWidth', 2.5);
hold on;
h4 = plot(charge_cycle150.data.Time, charge_cycle150.data.Current_charge, 'r--', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle150.data.Time + charge_cycle150_end_time, discharge_cycle150.data.Current_measured, 'r--', 'LineWidth', 2.5);
hold on;
ylabel('Current (A)'); 
xlabel('Time (s)');
legend([h1, h2, h3, h4], 'Cycle 2 Voltage', 'Cycle 150 Voltage', 'Cycle 2 Current', 'Cycle 150 Current', 'Location', 'northeast');
xticks(linspace(0, 15000, 7));
legend boxoff;hold off;

ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = linspace(0, 15000, 31);
ax.YAxis(1).MinorTick = 'on';
ax.YAxis(1).MinorTickValues = linspace(2.5, 4.5, 41);
ax.YAxis(2).MinorTick = 'on';
ax.YAxis(2).MinorTickValues = linspace(-4, 2, 31);

%%
% voltage & temperature profile
figure;
yyaxis left;
h1 = plot(charge_cycle2.data.Time, charge_cycle2.data.Voltage_measured, 'b-', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle2.data.Time + charge_cycle2_end_time, discharge_cycle2.data.Voltage_measured, 'b-', 'LineWidth', 2.5);
hold on;
h2 = plot(charge_cycle150.data.Time, charge_cycle150.data.Voltage_measured, 'b--', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle150.data.Time + charge_cycle150_end_time, discharge_cycle150.data.Voltage_measured, 'b--', 'LineWidth', 2.5);
hold on;
ylabel('Voltage (V)');
ylim([2.5, 4.5]);
yticks(linspace(2.5, 4.5, 9));

yyaxis right;
h3 = plot(charge_cycle2.data.Time, charge_cycle2.data.Temperature_measured, 'r-', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle2.data.Time + charge_cycle2_end_time, discharge_cycle2.data.Temperature_measured, 'r-', 'LineWidth', 2.5);
hold on;
h4 = plot(charge_cycle150.data.Time, charge_cycle150.data.Temperature_measured, 'r--', 'LineWidth', 2.5);
hold on;
plot(discharge_cycle150.data.Time + charge_cycle150_end_time, discharge_cycle150.data.Temperature_measured, 'r--', 'LineWidth', 2.5);
hold on;
ylabel('Temperature (°C)'); 
xlabel('Time (s)');
legend([h1, h2, h3, h4], 'Cycle 2 Voltage', 'Cycle 150 Voltage', 'Cycle 2 Temperature', 'Cycle 150 Temperature', 'Location', 'northeast');
xticks(linspace(0, 15000, 7));

legend boxoff;hold off;
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = linspace(0, 15000, 31);
ax.YAxis(1).MinorTick = 'on';
ax.YAxis(1).MinorTickValues = linspace(2.5, 4.5, 41);
ax.YAxis(2).MinorTick = 'on';
ax.YAxis(2).MinorTickValues = linspace(22, 42, 21);

%%
% CCCT、CVCT
num_cycles = length(discharge_cycles);
charge_current = cell(1, num_cycles);
charge_voltage = cell(1, num_cycles);
charge_current_time = cell(1, num_cycles);
CC_charge_current = cell(1, num_cycles);
CC_charge_voltage = cell(1, num_cycles);
CC_charge_current_time = cell(1, num_cycles);
CV_charge_current_time = cell(1, num_cycles);
CCCT = [];
CVCT = [];

threshold_index = zeros(1, num_cycles);
for i = 1:num_cycles
    charge_current{i} = charge_cycles(i).data.Current_charge;
    charge_voltage{i} = charge_cycles(i).data.Voltage_measured;
    charge_current_time{i} = charge_cycles(i).data.Time;
    threshold_index(i) = find(charge_voltage{i} >= 4.2, 1, 'first');
    if ~isempty(threshold_index(i))
        CC_charge_voltage{i} = charge_voltage{i}(1:threshold_index(i));
        CC_charge_current{i} = charge_current{i}(1:threshold_index(i));
        CC_charge_current_time{i} = charge_current_time{i}(1:threshold_index(i));
        CV_charge_current_time{i} = charge_current_time{i}(threshold_index(i)+1:end);
    end
    if length(CC_charge_current{i}) > 2
        CC_charge_current{i} = CC_charge_current{i}(3:end);
        CC_charge_voltage{i} = CC_charge_voltage{i}(3:end);
        CC_charge_current_time{i} = CC_charge_current_time{i}(3:end);
    end
    if ~isempty(CC_charge_current_time{i})
        CCCT = [CCCT, CC_charge_current_time{i}(end) - CC_charge_current_time{i}(1)];
    end
    if ~isempty(CV_charge_current_time{i})
        CVCT = [CVCT, CV_charge_current_time{i}(end) - CV_charge_current_time{i}(1)];
    end
end

%%
% VRET
charge_voltage_time = cell(1, num_cycles);
time_500s = cell(1, num_cycles);
time_1500s = cell(1, num_cycles);
voltage_500s = cell(1, num_cycles);
voltage_1500s = cell(1, num_cycles);

for i = 1:num_cycles
    charge_voltage{i} = charge_cycles(i).data.Voltage_measured;
    charge_voltage_time{i} = charge_cycles(i).data.Time;
    voltage = charge_voltage{i};
    voltage_time = charge_voltage_time{i};
    [~, idx_500] = min(abs(voltage_time - 500));
    time_500s{i} = voltage_time(idx_500);
    voltage_500s{i} = voltage(idx_500);
    [~, idx_1500] = min(abs(voltage_time - 1500));
    time_1500s{i} = voltage_time(idx_1500);
    voltage_1500s{i} = voltage(idx_1500);
end

VRET = zeros(1, num_cycles);
for i = 1:num_cycles
    VRET(i) = voltage_1500s{i} - voltage_500s{i};
end

%%
% CDET
time_3000s = cell(1, num_cycles);
time_4000s = cell(1, num_cycles);
current_3000s = cell(1, num_cycles);
current_4000s = cell(1, num_cycles);

for i = 1:num_cycles
    current_data = charge_cycles(i).data.Current_charge;
    time_data = charge_cycles(i).data.Time;
    [~, idx_3000] = min(abs(time_data - 3000));
    time_3000s{i} = time_data(idx_3000);
    current_3000s{i} = current_data(idx_3000);
    [~, idx_4000] = min(abs(time_data - 4000));
    time_4000s{i} = time_data(idx_4000);
    current_4000s{i} = current_data(idx_4000);
end
CDET = zeros(1, num_cycles);
for i = 1:num_cycles
    CDET(i) = current_3000s{i} - current_4000s{i};
end

%%
% TECD
current_intervals = cell(1, num_cycles); 
time_intervals = cell(1, num_cycles); 
sampled_current = cell(1, num_cycles);
sampled_time = cell(1, num_cycles);
relative_time = cell(1, num_cycles);
relative_time_sum = zeros(1, num_cycles);
TECD = zeros(1, num_cycles);

for i = 1:num_cycles
    current_data = charge_cycles(i).data.Current_charge;
    time_data = charge_cycles(i).data.Time;
    index_1_0 = find(abs(current_data - 1.0) == min(abs(current_data - 1.0)), 1, 'first');
    index_0_5 = find(abs(current_data - 0.5) == min(abs(current_data - 0.5)), 1, 'first');
    if index_1_0 > index_0_5
        [index_1_0, index_0_5] = deal(index_0_5, index_1_0);
    end
    current_interval = current_data(index_1_0:index_0_5);
    if ~issorted(current_interval, 'descend')
        current_interval = sort(current_interval, 'descend');
    end
    current_intervals{i} = current_interval;
    time_intervals{i} = time_data(index_1_0:index_0_5);
    sampled_time{i} = linspace(time_intervals{i}(1), time_intervals{i}(end), 50);
    sampled_current{i} = interp1(time_intervals{i}, current_intervals{i}, sampled_time{i}, 'linear'); 
    relative_time{i} = sampled_time{i} - sampled_time{i}(1);
    relative_time_sum(i) = sum(relative_time{i});
    TECD(i) = relative_time_sum(i) / 50;
end

%%
% CCDT
discharge_current = cell(1, num_cycles);
CC_discharge_current = cell(1, num_cycles);
discharge_time = cell(1, num_cycles);
CC_discharge_time = cell(1, num_cycles);
CCDT = [];
for i = 1:num_cycles
    discharge_current{i} = discharge_cycles(i).data.Current_measured;
    discharge_time{i} = discharge_cycles(i).data.Time;
    CC_discharge_current{i} = discharge_current{i}(3:end);
    CC_discharge_time{i} = discharge_time{i}(3:end);
    if ~isempty(CC_discharge_time{i})
        CCDT = [CCDT, CC_discharge_time{i}(end) - CC_discharge_time{i}(1)];
    end
end

%%
% TEVR
voltage_intervals_charge = cell(1, num_cycles); 
time_intervals_charge = cell(1, num_cycles); 
sampled_voltage_charge = cell(1, num_cycles);
sampled_time_charge = cell(1, num_cycles);
relative_time_charge = cell(1, num_cycles);
relative_time_sum_charge = zeros(1, num_cycles);
TEVR = zeros(1, num_cycles);

for i = 1:num_cycles
    voltage_data = charge_cycles(i).data.Voltage_measured;
    time_data = charge_cycles(i).data.Time;
    index_4_0 = find(abs(voltage_data - 4.0) == min(abs(voltage_data - 4.0)), 1, 'first');
    index_4_1 = find(abs(voltage_data - 4.1) == min(abs(voltage_data - 4.1)), 1, 'first');
    if index_4_0 > index_4_1
        [index_4_0, index_4_1] = deal(index_4_1, index_4_0);
    end
    voltage_interval = voltage_data(index_4_0:index_4_1);
    if ~issorted(voltage_interval, 'ascend')
        voltage_interval = sort(voltage_interval, 'ascend');
    end
    voltage_intervals_charge{i} = voltage_interval;
    time_intervals_charge{i} = time_data(index_4_0:index_4_1);
    sampled_time_charge{i} = linspace(time_intervals_charge{i}(1), time_intervals_charge{i}(end), 50);
    sampled_voltage_charge{i} = interp1(time_intervals_charge{i}, voltage_intervals_charge{i}, sampled_time_charge{i}, 'linear'); 
    relative_time_charge{i} = sampled_time_charge{i} - sampled_time_charge{i}(1);
    relative_time_sum_charge(i) = sum(relative_time_charge{i});
    TEVR(i) = relative_time_sum_charge(i) / 50;
end

%%
% TEVD
voltage_intervals = cell(1, num_cycles); 
time_intervals = cell(1, num_cycles); 
sampled_voltage = cell(1, num_cycles);
sampled_time = cell(1, num_cycles);
relative_time = cell(1, num_cycles);
relative_time_sum = zeros(1, num_cycles);
TEVD = zeros(1, num_cycles);

for i = 1:num_cycles
    voltage_data = discharge_cycles(i).data.Voltage_measured;
    time_data = discharge_cycles(i).data.Time;
    index_3_6 = find(abs(voltage_data - 3.6) == min(abs(voltage_data - 3.6)), 1, 'first');
    index_3_4 = find(abs(voltage_data - 3.4) == min(abs(voltage_data - 3.4)), 1, 'first');
    if index_3_6 > index_3_4
        [index_3_6, index_3_4] = deal(index_3_4, index_3_6);
    end
    voltage_interval = voltage_data(index_3_6:index_3_4);
    if ~issorted(voltage_interval, 'descend')
        voltage_interval = sort(voltage_interval, 'descend');
    end
    voltage_intervals{i} = voltage_interval;
    time_intervals{i} = time_data(index_3_6:index_3_4);
    sampled_time{i} = linspace(time_intervals{i}(1), time_intervals{i}(end), 50);
    sampled_voltage{i} = interp1(time_intervals{i}, voltage_intervals{i}, sampled_time{i}, 'linear'); 
    relative_time{i} = sampled_time{i} - sampled_time{i}(1);
    relative_time_sum(i) = sum(relative_time{i});
    TEVD(i) = relative_time_sum(i)/50;
end

%%
% VDET、SDV
time_500s = cell(1, num_cycles);
time_1500s = cell(1, num_cycles);
voltage_500s = cell(1, num_cycles);
voltage_1500s = cell(1, num_cycles);
MaxVoltageSlope = zeros(1, num_cycles);
AvgVoltageSlope = zeros(1, num_cycles); 

for i = 1:num_cycles
    voltage_data = discharge_cycles(i).data.Voltage_measured;
    time_data = discharge_cycles(i).data.Time;
    [~, idx_500] = min(abs(time_data - 500));
    time_500s{i} = time_data(idx_500);
    voltage_500s{i} = voltage_data(idx_500);
    [~, idx_1500] = min(abs(time_data - 1500));
    time_1500s{i} = time_data(idx_1500);
    voltage_1500s{i} = voltage_data(idx_1500);
    VDET(i) = voltage_500s{i} - voltage_1500s{i};
    if length(voltage_data) > 1 && length(time_data) > 1
        dt = diff(time_data);
        dV = diff(voltage_data);
        valid_indices = dt > 0;
        if any(valid_indices)
            voltage_slope = dV(valid_indices) ./ dt(valid_indices);
            MaxVoltageSlope(i) = max(voltage_slope);
            AvgVoltageSlope(i) = mean(voltage_slope);
        else
            MaxVoltageSlope(i) = 0;
            AvgVoltageSlope(i) = 0;
        end
    else
        MaxVoltageSlope(i) = 0;
        AvgVoltageSlope(i) = 0;
    end
end

%%
% HCT、HCTT
HCT = [];
HCTT = [];

for i = 1:num_cycles
    charge_temperature = charge_cycles(i).data.Temperature_measured;
    charge_time = charge_cycles(i).data.Time;
    [max_temp, max_temp_index] = max(charge_temperature);
    HCT = [HCT, max_temp];
    HCTT = [HCTT, charge_time(max_temp_index)];
end

%%
% HDT、HDTT、SDT、T_min、T_mean
HDT = [];
HDTT = [];
TempSlope = [];
MaxTempSlope = [];
AvgTempSlope = [];
mean_T = [];
min_T = [];

for i = 1:num_cycles
    discharge_temperature = discharge_cycles(i).data.Temperature_measured;
    discharge_time = discharge_cycles(i).data.Time;
    [max_temp, max_temp_index] = max(discharge_temperature);
    HDT = [HDT, max_temp];
    HDTT = [HDTT, discharge_time(max_temp_index)];
    mean_T = [mean_T, mean(discharge_temperature)];
    min_T = [min_T, min(discharge_temperature)];
    if length(discharge_temperature) > 1 && length(discharge_time) > 1
        dt = diff(discharge_time);
        dT = diff(discharge_temperature);
        valid_indices = dt > 0;
        if any(valid_indices)
            temp_slope = dT(valid_indices) ./ dt(valid_indices);
            TempSlope{i} = temp_slope;
            MaxTempSlope = [MaxTempSlope, max(temp_slope)];
            AvgTempSlope = [AvgTempSlope, mean(temp_slope)];
        else
            TempSlope{i} = [];
            MaxTempSlope = [MaxTempSlope, 0];
            AvgTempSlope = [AvgTempSlope, 0];
        end
    else
        TempSlope{i} = [];
        MaxTempSlope = [MaxTempSlope, 0];
        AvgTempSlope = [AvgTempSlope, 0];
    end
end

%%
% ACV
ACV = zeros(1, num_cycles);

for i = 1:num_cycles
    charge_voltage = charge_cycles(i).data.Voltage_measured;
    charge_time = charge_cycles(i).data.Time;
    time_range_indices = (charge_time >= 0) & (charge_time <= 10000);
    voltage_in_range = charge_voltage(time_range_indices);
    time_in_range = charge_time(time_range_indices);
    if ~isempty(time_in_range)
        ACV(i) = trapz(time_in_range, voltage_in_range);
    else
        ACV(i) = 0; 
    end
end

%%
% ACC
ACC = zeros(1, num_cycles);

for i = 1:num_cycles
    charge_current = charge_cycles(i).data.Current_charge;
    charge_time = charge_cycles(i).data.Time;
    time_range_indices = (charge_time >= 0) & (charge_time <= 10000);
    current_in_range = charge_current(time_range_indices);
    time_in_range = charge_time(time_range_indices);
    if ~isempty(time_in_range)
        ACC(i) = trapz(time_in_range, current_in_range);
    else
        ACC(i) = 0; 
    end
end

%%
% ACT
ACT = zeros(1, num_cycles);

for i = 1:num_cycles
    charge_temperature = charge_cycles(i).data.Temperature_measured;
    charge_time = charge_cycles(i).data.Time;
    time_range_indices = (charge_time >= 0) & (charge_time <= 10000);
    temperature_in_range = charge_temperature(time_range_indices);
    time_in_range = charge_time(time_range_indices);
    if ~isempty(time_in_range)
        ACT(i) = trapz(time_in_range, temperature_in_range);
    else
        ACT(i) = 0; 
    end
end

%%
% ADV、DV_std
ADV = zeros(1, num_cycles);
std_voltage = [];

for i = 1:num_cycles
    discharge_voltage = discharge_cycles(i).data.Voltage_measured;
    discharge_time = discharge_cycles(i).data.Time;
    time_range_indices = (discharge_time >= 0) & (discharge_time <= 2000);
    voltage_in_range = discharge_voltage(time_range_indices);
    time_in_range = discharge_time(time_range_indices);
    if ~isempty(time_in_range)
        ADV(i) = trapz(time_in_range, voltage_in_range);
    else
        ADV(i) = 0;
    end
    if ~isempty(discharge_voltage) && length(discharge_voltage) > 1
        valid_voltage = discharge_voltage(~isnan(discharge_voltage) & ~isinf(discharge_voltage));
        if length(valid_voltage) >= 2  
            voltage_std = std(valid_voltage);
            std_voltage = [std_voltage, voltage_std];
        else
            std_voltage = [std_voltage, NaN];
        end
    else
        std_voltage = [std_voltage, NaN];
    end
end

%%
% ADC
ADC = zeros(1, num_cycles);

for i = 1:num_cycles
    discharge_current = discharge_cycles(i).data.Current_measured;
    discharge_time = discharge_cycles(i).data.Time;
    time_range_indices = (discharge_time >= 0) & (discharge_time <= 2000);
    current_in_range = discharge_current(time_range_indices);
    time_in_range = discharge_time(time_range_indices);
    if ~isempty(time_in_range)
        ADC(i) = trapz(time_in_range, current_in_range);
    else
        ADC(i) = 0; 
    end
end

%%
% ADT、TETR、TRET
ADT = zeros(1, num_cycles);
TETR = zeros(1, num_cycles);
TRET = zeros(1, num_cycles);

for i = 1:num_cycles
    discharge_temperature = discharge_cycles(i).data.Temperature_measured;
    discharge_time = discharge_cycles(i).data.Time;
    time_range_indices = (discharge_time >= 0) & (discharge_time <= 2000);
    temperature_in_range = discharge_temperature(time_range_indices);
    time_in_range = discharge_time(time_range_indices);
    if ~isempty(time_in_range)
        ADT(i) = trapz(time_in_range, temperature_in_range);
    else
        ADT(i) = 0;
    end
    if ~isempty(discharge_temperature) && ~isempty(discharge_time) && ...
       length(discharge_temperature) == length(discharge_time)
        valid_idx = ~isnan(discharge_temperature) & ~isnan(discharge_time);
        temp_clean = discharge_temperature(valid_idx);
        time_clean = discharge_time(valid_idx);
        if length(temp_clean) >= 2
            min_temp = min(temp_clean);
            max_temp = max(temp_clean);
            if min_temp <= 32 && max_temp >= 36
                [~, idx_32] = min(abs(temp_clean - 32));
                time_32 = time_clean(idx_32);
                [~, idx_36] = min(abs(temp_clean - 36));
                time_36 = time_clean(idx_36);
                TETR(i) = abs(time_36 - time_32);
            else
                TETR(i) = 0;
            end
        else
            TETR(i) = 0; 
        end
    else
        TETR(i) = 0; 
    end
    if ~isempty(discharge_temperature) && ~isempty(discharge_time) && ...
       length(discharge_temperature) == length(discharge_time)
        valid_idx = ~isnan(discharge_temperature) & ~isnan(discharge_time);
        temp_clean = discharge_temperature(valid_idx);
        time_clean = discharge_time(valid_idx);
        if length(temp_clean) >= 2
            [~, idx_1000] = min(abs(time_clean - 1000));
            temp_1000 = temp_clean(idx_1000);
            [~, idx_2000] = min(abs(time_clean - 2000));
            temp_2000 = temp_clean(idx_2000);
            TRET(i) = abs(temp_2000 - temp_1000);
        else
            TRET(i) = 0;
        end
    else
        TRET(i) = 0; 
    end
end