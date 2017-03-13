chmod 664 /proc/hps/*
echo 8 > /proc/hps/num_limit_low_battery
echo 8 > /proc/hps/num_limit_power_serv
echo 8 > /proc/hps/num_limit_thermal
echo 8 > /proc/hps/num_limit_ultra_power_saving
chmod 644 /proc/gpufreq/gpufreq_opp_max_freq
echo 0 >/proc/gpufreq/gpufreq_opp_max_freq
cd /proc/cpufreq
chmod 644 cpufreq_limited_max_freq_by_user
#最高频率(highest frequency): 403 806 1183 1326 1469 1625 1781 1950
echo 1469000 > cpufreq_limited_max_freq_by_user

chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#最低频率(lowest frequency) 参数同上，注意要比最高频率低
echo 403000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#保持一致 must keep the same as the highest frequency.
echo 1469000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
cd /sys/devices/system/cpu/cpufreq/interactive
chmod 644 *
echo 2 > /proc/hps/input_boost_cpu_num
echo 0 > /proc/hps/input_boost_enable
#保持一致,接下来的4行是CPU个数，1-8，一定要保持相同。
echo 4 > /proc/hps/num_limit_low_battery
echo 4 > /proc/hps/num_limit_power_serv
echo 4 > /proc/hps/num_limit_thermal
echo 4 > /proc/hps/num_limit_ultra_power_saving

echo 0 > /proc/hps/rush_boost_enable
chmod 444 /proc/hps/*
#GPU频率，可用参数:253 299 390 442 546
chmod 664 /proc/gpufreq/gpufreq_opp_max_freq 
echo 299000 > /proc/gpufreq/gpufreq_opp_max_freq

chmod 444 /proc/gpufreq/gpufreq_opp_max_freq 
echo "1000" > timer_rate
echo "806000" > hispeed_freq
echo "5000 1183000:3000 1326000:4000 1469000:5000" > above_hispeed_delay
echo "1000" > min_sample_time
echo "200000" > timer_slack
echo "90 806000:99 1183000:98 1326000:98 1469000:99" > target_loads
echo "99" > go_hispeed_load
chmod 444 *
echo f2834c1b-20a4-4b89-bee2-e88f622f6a3d-00000011 $?
echo f2834c1b-20a4-4b89-bee2-e88f622f6a3d-00000011 >&2
